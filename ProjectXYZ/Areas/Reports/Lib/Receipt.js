$(document).ready(function () {

    $(".main-header").find(".title").html("Receipts");

    $('#reportrange').daterangepicker(
        {
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment().subtract(29, 'days'),
            endDate: moment()
        },
        function (start, end) {
            $('#reportrange span').html(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));
        }
    );

    Clear();

    //#region FUNCTION

    function Clear() {
        $('input[name="rbDay"]').prop('checked', false);
        $('input#AllDay').prop('checked', true);
        $('.CustomDay').find('.datetimepicker-input').prop('disabled', true);
        $('#starttime').val(moment(new Date()).format('LT'));
        $('#endtime').val(moment(new Date()).format('LT'));
        $('#reportrange span').html(moment().subtract('days', 29).format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));
        
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function formatCurrency(curr) {
        curr = parseFloat(curr);
        curr = curr.toFixed(0, 0);
        curr = curr.replace(".", ",");
        curr = ("Rp " + curr).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return curr;
    }

    function delFormatCurrency(curr) {
        var fixed;
        fixed = curr.substr(0, 3);
        curr = curr.replace(fixed, "");
        for (i = 1; curr.length > i * 3; i++) {
            curr = curr.replace(".", "");
        }
        return curr;
    }

    function GetData() {
        try {
            var startDate = $('#reportrange').data('daterangepicker').startDate._d;
            var endDate = $('#reportrange').data('daterangepicker').endDate._d;
            startDate = moment(startDate).format('YYYY-MM-DD');
            endDate = moment(endDate).format('YYYY-MM-DD');
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var AllDay = $('input#AllDay').is(':checked');
            var Employee_ID = emptyStr($('#employees').val()) ? "" : $('#employees').val();
            var model = {
                'DateFrom': startDate,
                'DateTo': endDate,
                'FilterTime': AllDay,
                'TimeFrom': TimeFrom,
                'TimeTo': TimeTo,
                'Employee_ID': Employee_ID,
                'Store_ID': ""
            }

            $('#table_export tbody').empty();
            $('#table_export').DataTable().destroy();

            dtTable = $('#table_export').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Reports/Receipt/ReportsReceiptGetDataList',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
                    error: function (xhr) {
                        var doc = $.parseHTML(xhr.responseText);
                        if (!emptyStr(doc)) {
                            var titleNode = doc.filter(function (node) {
                                return node.localName === "title";
                            });
                            var msg = titleNode[0].textContent;
                            swal("Error", "Error : " + msg, "error");
                        }
                        else {
                            if (xhr.statusText.toUpperCase().trim() != "OK") {
                                swal({ type: "error", title: "Error", text: xhr.statusText });
                            }
                        }
                    }
                },
                columns: [
                    { data: 'DOCNUMBER' },
                    {
                        data: 'DOCDATE',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            return moment(data).format("MMM DD, YYYY");
                        }
                    },
                    { data: 'Store_Name' },
                    { data: 'Employee_Name' },
                    { data: 'Customer' },
                    { data: 'TrxType' },
                    {
                        data: 'Total',
                        className: "text-right no-wrap",
                        render: function (data, type, row) {
                            var amount = emptyStr(data) ? 0 : data;
                            return formatCurrency(amount);
                        }
                    }
                ],
                order: [],
                buttons: [
                    {
                        extend: 'excel',
                        className: 'hidden',
                        text: '',
                        exportOptions: {
                            modifier: {
                                page: 'all',
                                order: 'index',
                                search: 'none'
                            },
                        }
                    }
                ],
                dom: "<'row'<'col-6 col-sm-6 col-md-6 col-lg-6'l><'col-6 col-sm-6 col-md-6 col-lg-6'f>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'col-6 col-sm-6 col-md-6 col-lg-6'i><'col-6 col-sm-6 col-md-6 col-lg-6'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_export').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    //#endregion

    //#region EVENT

    $.fn.dataTable.moment = function (format, locale) {
        var types = $.fn.dataTable.ext.type;

        // Add type detection
        types.detect.unshift(function (d) {
            return moment(d, format, locale, true).isValid() ?
                'moment-' + format :
                null;
        });

        // Add sorting method - use an integer for the sorting
        types.order['moment-' + format + '-pre'] = function (d) {
            return moment(d, format, locale, true).unix();
        };
    };

    $.fn.dataTable.moment($("#dafor").val());

    $('.datetimepicker-input').datetimepicker({
        format: 'LT'
    });

    $('.datetimepicker-input').on('hide.datetimepicker', function () {
        try {
            //GetDataTop5();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.datetimepicker-input').on('change.datetimepicker', function () {
        try {
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var starttime = $('#starttime').val();
            var endtime = $('#endtime').val();
            var id = $(this).attr("id");
            if (TimeFrom > TimeTo) {
                if (id == "starttime") {
                    $('#endtime').val(starttime);
                } else if (id == "endtime") {
                    $('#starttime').val(endtime);
                }
            }
            //GetDataTop5();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.titleChart').on('click', function () {
        try {
            var title = $(this).find('p').html();
            var id = $(this).attr('id');
            FilterChart = id;
            $("#titleChart").html(title);
            $('.titleChart').removeClass("active-title");
            $(this).addClass("active-title");
            GetDataChart();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    placeHolder = '<span><i class="fa fa-user pr-2"></i>All Employees</span>';
    $("#employees").select2({
        dropdownParent: $("#employees").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Dashboard/GetEmployee',
            type: 'POST',
            dataType: 'json',
            data: function (params) {
                return {
                    Prefix: params.term
                }
            },
            processResults: function (data) {
                return {
                    results: $.map(data.data,
                        function (obj) {
                            var nilai = obj.Employee_ID.trim();
                            var textnilai = obj.Employee_Name.trim();
                            return { id: nilai, text: textnilai };
                        })
                };
            },
            error: function (xhr) {
                if (xhr.status != "200") {
                    var doc = $.parseHTML(xhr.responseText);
                    if (!emptyStr(doc)) {
                        var titleNode = doc.filter(function (node) {
                            return node.localName === "title";
                        });
                        var msg = titleNode[0].textContent;
                        swal("Error", "Error : " + msg, "error");
                    }
                    else {
                        if (xhr.statusText.toUpperCase().trim() != "OK") {
                            swal({ type: "error", title: "Error", text: xhr.statusText });
                        }
                    }
                }
            }
        },
        escapeMarkup: function (m) {
            return m;
        }
    });

    $('#btnExport').on('click', function () {
        try {
            dtTable.buttons(0).trigger();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#AllStores').on('click', function () {
        try {
            var checked = $(this).is(":checked");
            $("input[type=checkbox][name=cbStores]").prop("checked", checked);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("input[type=checkbox][name=cbStores]").on('click', function () {
        try {
            var count = 0;
            var countAll = 0;
            $('#AllStores').prop("checked", false);
            $.each($("ul.allStores > li input[type=checkbox][name=cbStores]"), function () {
                var checked = $(this).is(":checked");
                countAll++;
                if (checked) {
                    count++;
                }
            });
            if (count - 1 == countAll - 1) {
                $('#AllStores').prop("checked", true);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

});