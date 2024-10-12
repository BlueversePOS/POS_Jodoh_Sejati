$(document).ready(function () {

    $(".main-header").find(".title").html("Dashboard");

    const xValues = [];
    const yValues = [];

    const dtValues = [];
    var bChart = null;
    var FilterChart = 1;
    var maxValue = 200000;

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
            GetHeaderChart();
            GetDataChart();
            GetData();
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

        $("#titleChart").html("Gross Sales");
        $("#GrossSales").html(formatCurrency(0)).parents(".titleChart").addClass("active-title");
        $("#bGrossSales").html(formatCurrency(0));
        $("#Refund").html(formatCurrency(0));
        $("#bRefund").html(formatCurrency(0));
        $("#Discount").html(formatCurrency(0));
        $("#bDiscount").html(formatCurrency(0));
        $("#NetSales").html(formatCurrency(0));
        $("#bNetSales").html(formatCurrency(0));
        $("#GrossProfit").html(formatCurrency(0));
        $("#bGrossProfit").html(formatCurrency(0));

        GetHeaderChart();
        loadChart();
        GetData();
    }

    function loadChart() {
        const ctx = document.getElementById('line-chart').getContext('2d');

        if (bChart != null) bChart.destroy();

        bChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: xValues,
                datasets: [{
                    backgroundColor: "white",
                    borderColor: "green",
                    label: "",
                    data: yValues,
                    borderWidth: 2
                }]
            },
            options: {
                legend: { display: false },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        bChart.update();
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

    function GetHeaderChart() {
        try {
            var startDate = $('#reportrange').data('daterangepicker').startDate._d;
            var endDate = $('#reportrange').data('daterangepicker').endDate._d;
            startDate = moment(startDate).format('YYYY-MM-DD');
            endDate = moment(endDate).format('YYYY-MM-DD');
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var AllDay = $('input#AllDay').is(':checked');
            var model = {
                'DateFrom': startDate,
                'DateTo': endDate,
                'FilterTime': AllDay,
                'TimeFrom': TimeFrom,
                'TimeTo': TimeTo
            }
            
            $.ajax({
                url: rootUrl + "Reports/SalesSummary/ReportsSummaryGetHeaderChart",
                type: "POST",
                dataType: "json",
                data: { model: model },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Quantity = emptyStr(value.Quantity) ? 0 : value.Quantity,
                                Gross_Sales = emptyStr(value.Gross_Sales) ? 0 : value.Gross_Sales,
                                Refund_Amount = emptyStr(value.Refund_Amount) ? 0 : value.Refund_Amount,
                                Discount_Amount = emptyStr(value.Discount_Amount) ? 0 : value.Discount_Amount,
                                Net_Sales = emptyStr(value.Net_Sales) ? 0 : value.Net_Sales,
                                Gross_Profit = emptyStr(value.Gross_Profit) ? 0 : value.Gross_Profit;

                            $("#GrossSales").html(formatCurrency(Gross_Sales));
                            $("#Refund").html(formatCurrency(Refund_Amount));
                            $("#Discount").html(formatCurrency(Discount_Amount));
                            $("#NetSales").html(formatCurrency(Net_Sales));
                            $("#GrossProfit").html(formatCurrency(Gross_Profit));
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

    function GetDataChart() {
        try {
            var startDate = $('#reportrange').data('daterangepicker').startDate._d;
            var endDate = $('#reportrange').data('daterangepicker').endDate._d;
            startDate = moment(startDate).format('YYYY-MM-DD');
            endDate = moment(endDate).format('YYYY-MM-DD');
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var AllDay = $('input#AllDay').is(':checked');
            var model = {
                'DateFrom': startDate,
                'DateTo': endDate,
                'FilterTime': AllDay,
                'TimeFrom': TimeFrom,
                'TimeTo': TimeTo,
                'FilterChart': FilterChart
            }
            xValues.length = 0;
            yValues.length = 0;
            maxValue = 200000;

            $.ajax({
                url: rootUrl + "Reports/SalesSummary/ReportsSummaryGetDataChart",
                type: "POST",
                dataType: "json",
                data: { model: model },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var DOCDATE = moment(value.DOCDATE).format("MMM DD"),
                                Amount = emptyStr(value.Amount) ? 0 : value.Amount;
                            maxValue = index == 0 || Amount > maxValue ? Amount : maxValue;
                            xValues.push(DOCDATE);
                            yValues.push({
                                x: DOCDATE,
                                y: Amount
                            });
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
            }).done(function () {
                loadChart();
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function GetData() {
        try {
            var startDate = $('#reportrange').data('daterangepicker').startDate._d;
            var endDate = $('#reportrange').data('daterangepicker').endDate._d;
            startDate = moment(startDate).format('YYYY-MM-DD');
            endDate = moment(endDate).format('YYYY-MM-DD');
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var AllDay = $('input#AllDay').is(':checked');
            var model = {
                'DateFrom': startDate,
                'DateTo': endDate,
                'FilterTime': AllDay,
                'TimeFrom': TimeFrom,
                'TimeTo': TimeTo
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
                    url: rootUrl + 'Reports/SalesSummary/ReportsSummaryGetDataList',
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
                    {
                        data: 'DOCDATE',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            return moment(data).format("MMM DD, YYYY");
                        }
                    },
                    { data: 'Gross_Sales' },
                    { data: 'Refund_Amount' },
                    { data: 'Discount_Amount' },
                    { data: 'Net_Sales' },
                    { data: 'CostofGoods' },
                    { data: 'Gross_Profit' }
                ],
                columnDefs: [
                    {
                        targets: [1, 2, 3, 4, 5, 6],
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

    $('#reportrange span').html(moment().subtract('days', 29).format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));

    $('.datetimepicker-input').datetimepicker({
        format: 'LT'
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

    $('#btnExport').on('click', function () {
        try {
            dtTable.buttons(0).trigger();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

});