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
            GetData();
        }
    );

    var dataId = 0;

    Clear();

    //#region FUNCTION

    function Clear() {
        $('input[name="rbDay"]').prop('checked', false);
        $('input#AllDay').prop('checked', true);
        $('.CustomDay').find('.datetimepicker-input').prop('disabled', true);
        $('#starttime').val(moment(new Date()).format('LT'));
        $('#endtime').val(moment(new Date()).format('LT'));
        $('#reportrange span').html(moment().subtract('days', 29).format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));
        $('.titleChart#0').trigger('click').addClass("active-title");
        
        GetData(dataId);
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

    function GetData(status) {
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
                'Store_ID': "",
                'Status': status
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
                    { data: 'CustName' },
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
                },
                initComplete: function (settings, json) {
                    var countAll = 0;
                    var countSales = 0;
                    var countRefund = 0;
                    dtTable.column(0).nodes().to$().each(function (index) {
                        var currow = $(this).closest("tr");
                        var trxType = emptyStr(currow.find("td:eq(5)").text()) ? "" : currow.find("td:eq(5)").text().trim();
                        if (trxType.toUpperCase() == "SALE") {
                            countSales++;
                        } else if (trxType.toUpperCase() == "REFUND") {
                            countRefund++;
                        }
                        countAll++;
                    });
                    $("#Sales").text(countSales);
                    $("#Refund").text(countRefund);
                    $("#allReceipt").text(countAll);
                }
            });
            $('#table_export').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataDetail() {
        try {
            var DOCNUMBER = emptyStr($("#DOCNUMBER").val()) ? "" : $("#DOCNUMBER").val();
            $("#table_bill tbody").find("tr").remove();
            $("#table_bill tbody").empty();
            $.ajax({
                url: rootUrl + "Reports/Receipt/ReportsReceiptGetDetail",
                type: "POST",
                dataType: "json",
                data: { DOCNUMBER: DOCNUMBER },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var DOCNUMBER = emptyStr(value.DOCNUMBER) ? "" : value.DOCNUMBER.trim(),
                                DOCDATE = moment(value.DOCDATE).format("MMM DD, YYYY"),
                                Item_Description = emptyStr(value.Item_Description) ? "" : value.Item_Description.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim(),
                                Employee_Name = emptyStr(value.Employee_Name) ? "" : value.Employee_Name.trim(),
                                CustName = emptyStr(value.CustName) ? "" : value.CustName.trim(),
                                TrxType = emptyStr(value.TrxType) ? "" : value.TrxType.trim(),
                                Quantity = emptyStr(value.Quantity) ? 0 : value.Quantity,
                                Item_Price = emptyStr(value.Item_Price) ? 0 : value.Item_Price,
                                Discount_Amount = emptyStr(value.Discount_Amount) ? 0 : value.Discount_Amount,
                                Subtotal = emptyStr(value.Subtotal) ? 0 : value.Subtotal,
                                Total = emptyStr(value.Total) ? 0 : value.Total;
                            var colorTxt = "black";
                            if (TrxType.toLowerCase() == "refund") {
                                colorTxt = "red";
                            }
                            var discTxt = "";
                            if (Discount_Amount > 0) {
                                discTxt = '<br /><span>' + formatCurrency(Discount_Amount) + '</span>';
                            }
                            var tbody =
                                '<tr>' +
                                '<td class="pb-1" style="width: 70%;">' +
                                '<div class="col-12 px-0">' +
                                '<span class="w-100">' + Item_Description + '</span>' +
                                '<br /><span class="w-100 text-gray">' + Quantity.toString() + ' x ' + formatCurrency(Item_Price) + '</span>' +
                                discTxt +
                                '</div>' +
                                '</td>' +
                                '<td class="pb-1 float-right no-wrap">' + formatCurrency(Subtotal) + '</td>' +
                                '</tr>';
                            $("#table_bill").append(tbody);

                            $("#DocType").html(TrxType).prop("style", "color: " + colorTxt);
                            $("#Amount").html(formatCurrency(Total));
                            $("#Employee_Name").html(Employee_Name);
                            $("#Store_ID").html(Store_Name);
                            $("#TotalBill").html(formatCurrency(Total));
                            $("#DOCDATE").html(DOCDATE);
                            $("#DOCNUMBER_txt").html(DOCNUMBER);
                        });
                    }
                    else {
                        swal({ type: "error", title: "Error", text: result.message });
                    }
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
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

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
            GetData(dataId);
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
            GetData(dataId);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.titleChart').on('click', function () {
        try {
            var title = $(this).find('p').html();
            var id = $(this).attr('id');
            dataId = id;
            $("#titleChart").html(title);
            $('.titleChart').removeClass("active-title");
            $(this).addClass("active-title");
            GetData(dataId);
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

    $("#table_export tbody").on("dblclick", "tr", function () {
        try {
            var currow = $(this).closest("tr");
            var DOCNUMBER = emptyStr(currow.find("td:eq(0)").text()) ? "" : currow.find("td:eq(0)").text().trim();
            $("#myModalDetail").find("#DOCNUMBER").val(DOCNUMBER);
            GetDataDetail();
            $("#myModalDetail").modal();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.allStores.show').on('hide', function () {
        try {
            GetData(dataId);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#employees").on("change", function () {
        try {
            GetData(dataId);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

});