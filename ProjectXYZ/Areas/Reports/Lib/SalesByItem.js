$(document).ready(function () {

    $(".main-header").find(".title").html("Sales By Item");

    const xValues = ["Jul 07", "Jul 08", "Jul 09", "Jul 10", "Jul 11", "Jul 12", "Jul 13", "Jul 14", "Jul 15", "Jul 16", "Jul 17", "Jul 18", "Jul 19", "Jul 20", "Jul 21", "Jul 22",
        "Jul 23", "Jul 24", "Jul 25", "Jul 26", "Jul 27", "Jul 28", "Jul 29", "Jul 30", "Jul 31", "Aug 01", "Aug 02", "Aug 03", "Aug 04", "Aug 05"];
    const yValues = [
        { x: "Jul 07", y: 0 },
        { x: "Jul 08", y: 0 },
        { x: "Jul 09", y: 0 },
        { x: "Jul 10", y: 0 },
        { x: "Jul 11", y: 0 },
        { x: "Jul 12", y: 0 },
        { x: "Jul 13", y: 0 },
        { x: "Jul 14", y: 0 },
        { x: "Jul 15", y: 0 },
        { x: "Jul 16", y: 0 },
        { x: "Jul 17", y: 0 },
        { x: "Jul 18", y: 0 },
        { x: "Jul 19", y: 0 },
        { x: "Jul 20", y: 0 },
        { x: "Jul 21", y: 0 },
        { x: "Jul 22", y: 0 },
        { x: "Jul 23", y: 0 },
        { x: "Jul 24", y: 0 },
        { x: "Jul 25", y: 0 },
        { x: "Jul 26", y: 0 },
        { x: "Jul 27", y: 0 },
        { x: "Jul 28", y: 0 },
        { x: "Jul 29", y: 0 },
        { x: "Jul 30", y: 0 },
        { x: "Jul 31", y: 0 },
        { x: "Aug 01", y: 0 },
        { x: "Aug 02", y: 0 },
        { x: "Aug 03", y: 0 },
        { x: "Aug 04", y: 17000 },
        { x: "Aug 05", y: 0 }
    ];

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

    function GetDataTop5() {
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
                                Item_Color = emptyStr(value.Item_Color) ? "" : value.Item_Color.trim(),
                                Net_Sales = emptyStr(value.Net_Sales) ? "" : value.Net_Sales;
                            var tbody =
                                '<tr>' +
                                '<td class="pb-1" style="width: 70%;">' +
                                '<div class="row mx-0">' +
                                '<div class="shapes ' + Item_Color + ' mr-2 text-center text-white pt-1" style="border-radius: 50%;"></div>' +
                                '<span>' + Item_Description + '</span></div></td>' +
                                '<td class="pb-1 text-right" style="width: 30%;">' + formatCurrency(Net_Sales) + '</td>' +
                                '</tr>';
                            $("#table_netSales").append(tbody);
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

    new Chart("divChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: "white",
                borderColor: "green",
                label: "", //"Gross Sales",
                data: yValues,
                borderWidth: 2
            }]
        },
        options: {
            legend: { display: false },
            scales: {
                yAxes: [{ ticks: { min: 0, max: 20000 } }]
            }
        }
    });

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
            //GetData();
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

    //#endregion
});