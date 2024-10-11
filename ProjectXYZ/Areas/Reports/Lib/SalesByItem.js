$(document).ready(function () {

    $(".main-header").find(".title").html("Sales By Item");

    var xValues = [];
    var cValues = [];
    var rawData = [];
    var bChart = null;

    //#region FUNCTION

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
            GetDataTop5();
            GetData();
        }
    );

    Clear();

    function Clear() {
        $('#reportrange span').html(moment().subtract('days', 29).format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));
        $('input[name="rbDay"]').prop('checked', false);
        $('input#AllDay').prop('checked', true);
        $('.CustomDay').find('.datetimepicker-input').prop('disabled', true);
        $('#starttime').val(moment(new Date()).format('LT'));
        $('#endtime').val(moment(new Date()).format('LT'));
        GetDataTop5();
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

    function getColor(itemColor) {
        if (itemColor == "red") itemColor = 'rgb(220, 53, 69)';
        else if (itemColor == "green") itemColor = 'rgb(0, 255, 0)';
        else if (itemColor == "blue") itemColor = 'rgb(0, 123, 255)';
        else if (itemColor == "yellow") itemColor = 'rgb(255, 255, 0)';
        else if (itemColor == "cyan") itemColor = 'rgb(0, 255, 255)';
        else if (itemColor == "magenta") itemColor = 'rgb(255, 0, 255)';
        else if (itemColor == "black") itemColor = 'rgb(0, 0, 0)';
        else if (itemColor == "white") itemColor = 'rgb(255, 255, 255)';
        else if (itemColor == "orange") itemColor = 'rgb(255, 165, 0)';
        else if (itemColor == "purple") itemColor = 'rgb(111, 66, 193)';
        else if (itemColor == "pink") itemColor = 'rgb(232, 62, 140)';
        else if (itemColor == "brown") itemColor = 'rgb(165, 42, 42)';
        else if (itemColor == "gray") itemColor = 'rgb(128, 128, 128)';
        else if (itemColor == "darkgreen") itemColor = 'rgb(0, 100, 0)';
        else if (itemColor == "darkblue") itemColor = 'rgb(0, 0, 139)';
        else if (itemColor == "darkred") itemColor = 'rgb(139, 0, 0)';
        return itemColor;
    }

    function dataGrouping() {
        const uniqueDates = [...new Set(rawData.map(item => item.date))];
        
        const datasets = rawData.map((item, index) => ({
            label: `${item.date} - ${index + 1}`,
            data: uniqueDates.map(date => (date === item.date ? item.amount : null)),
            backgroundColor: cValues[index],
            borderColor: cValues[index],
            borderWidth: 1
        }));

        const ctx = document.getElementById('divChart').getContext('2d');

        if (bChart != null) bChart.destroy();

        bChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: uniqueDates,
                datasets: datasets
            },
            options: {
                responsive: true,
                legend: { display: false },
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        bChart.update();
    }

    function GetDataTop5() {
        try {
            var startDate = $('#reportrange').data('daterangepicker').startDate._d;
            var endDate = $('#reportrange').data('daterangepicker').endDate._d;
            startDate = moment(startDate).format('YYYY-MM-DD');
            endDate = moment(endDate).format('YYYY-MM-DD');
            var TimeFrom = moment($('#starttime').val(), 'LT').format('HH:mm:ss');
            var TimeTo = moment($('#endtime').val(), 'LT').format('HH:mm:ss');
            var AllDay = $('input#AllDay').is(':checked');
            var maxValue = 1000000;
            var model = {
                'DateFrom': startDate,
                'DateTo': endDate,
                'FilterTime': AllDay,
                'TimeFrom': TimeFrom,
                'TimeTo': TimeTo
            }
            xValues.length = 0;
            cValues.length = 0;
            rawData.length = 0;

            $("#table_netSales").find("tbody tr").remove();
            $("#table_netSales").find("tbody").empty();
            $.ajax({
                url: rootUrl + "Reports/SalesByItem/ReportsItemsGetDataTop5",
                type: "POST",
                dataType: "json",
                data: { model: model },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Item_Number = emptyStr(value.Item_Number) ? "" : value.Item_Number.trim(),
                                Item_Description = emptyStr(value.Item_Description) ? "" : value.Item_Description.trim(),
                                DOCDATE = moment(value.DOCDATE).format("YYYY MMM DD"),
                                Item_Color = emptyStr(value.Item_Color) ? "" : value.Item_Color.trim(),
                                Net_Sales = emptyStr(value.Net_Sales) ? "" : value.Net_Sales;
                            maxValue = index == 0 || Net_Sales > maxValue ? value.Net_Sales : maxValue;
                            var tbody =
                                '<tr>' +
                                '<td class="pb-1" style="width: 70%;">' +
                                '<div class="row mx-0">' +
                                '<div class="shapes ' + Item_Color + ' mr-2 text-center text-white pt-1" style="border-radius: 50%;"></div>' +
                                '<span>' + Item_Description + '</span></div></td>' +
                                '<td class="pb-1 text-right" style="width: 30%;">' + formatCurrency(Net_Sales) + '</td>' +
                                '</tr>';
                            $("#table_netSales").append(tbody);

                            cValues.push(getColor(Item_Color.replace("bg-", "")));
                            rawData.push({
                                date: moment(DOCDATE).format("YYYY MMM DD"),
                                amount: Net_Sales
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
                xValues = rawData.slice();
                dataGrouping();
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
                    url: rootUrl + 'Reports/SalesByItem/ReportsItemsGetDataList',
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
                        data: 'Item_Description',
                        orderable: false,
                        width: '20%',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(data) ? "" : data;
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            if (LineItem_Option != 0) {
                                Item_Description = "&nbsp&nbsp&nbsp" + Item_Description;
                            }
                            return Item_Description;
                        }
                    },
                    {
                        data: 'Item_SKU',
                        orderable: false,
                        width: '12%'
                    },
                    {
                        data: 'Category_Name',
                        orderable: false
                    },
                    {
                        data: 'Quantity',
                        className: 'text-right',
                        orderable: false
                    },
                    {
                        data: 'Gross_Sales',
                        className: 'text-right text-nowrap',
                        orderable: false,
                        render: function (data, type, row) {
                            var Gross_Sales = emptyStr(data) ? 0 : data;
                            return formatCurrency(Gross_Sales);
                        }
                    },
                    {
                        data: 'Net_Sales',
                        className: 'text-right text-nowrap',
                        orderable: false,
                        render: function (data, type, row) {
                            var Net_Sales = emptyStr(data) ? 0 : data;
                            return formatCurrency(Net_Sales);
                        }
                    },
                    {
                        data: 'CostofGoods',
                        className: 'text-right text-nowrap',
                        orderable: false,
                        render: function (data, type, row) {
                            var CostOfGoods = emptyStr(data) ? 0 : data;
                            return formatCurrency(CostOfGoods);
                        }
                    },
                    {
                        data: 'Gross_Profit',
                        className: 'text-right text-nowrap',
                        orderable: false,
                        render: function (data, type, row) {
                            var GrossProfit = emptyStr(data) ? 0 : data;
                            return formatCurrency(GrossProfit);
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
                dom: "<'row'<'col-6 col-sm-6 col-md-6 col-lg-6'l><'col-6 col-sm-6 col-md-6 col-lg-6'>>" +
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

    $('#typeTimes').select2();

    $('.datetimepicker-input').datetimepicker({
        format: 'LT'
    });

    $('.datetimepicker-input').on('hide.datetimepicker', function () {
        try {
            GetDataTop5();
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
            GetDataTop5();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('input[name="rbDay"]').on('click', function () {
        try {
            $('input[name="rbDay"]').prop('checked', false);
            $(this).prop('checked', true);
            $('.CustomDay').find('.datetimepicker-input').prop('disabled', true);
            var id = emptyStr($(this).attr('id')) ? "" : $(this).attr('id');
            if (!emptyStr(id) && id.toLowerCase() == "customday") {
                $('.CustomDay').find('.datetimepicker-input').prop('disabled', false);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#typeTimes').on('change', function () {
        try {
            var typeTimes = emptyStr($('#typeTimes').val()) ? "" : $('#typeTimes').val();
            var formatDate = "YYYY MMM DD";
            if (typeTimes == "1") {
                formatDate = "YYYY MMM DD";
            } else if (typeTimes == "2") {
                formatDate = "YYYY MMM";
            } else if (typeTimes == "3") {
                formatDate = "YYYY";
            }
            rawData = xValues.slice();
            if (typeTimes != "1") {
                var groupedData = {};
                rawData.forEach(item => {
                    var date = moment(item.date).format(formatDate);
                    if (groupedData[date]) {
                        groupedData[date] += item.amount;
                    } else {
                        groupedData[date] = item.amount;
                    }
                });

                const result = Object.keys(groupedData).map(date => ({
                    date: date,
                    amount: groupedData[date]
                }));
                rawData = result.slice();
            }
            dataGrouping();
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