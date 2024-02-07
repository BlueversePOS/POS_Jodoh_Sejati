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

    $('#reportrange span').html(moment().subtract('days', 29).format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));

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

    var placeHolder = '<span><i class="far fa-clock pr-2"></i>All Day</span>';
    $("#times").select2({
        dropdownParent: $("#times").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        escapeMarkup: function (m) {
            return m;
        }
    });

    //#endregion
});