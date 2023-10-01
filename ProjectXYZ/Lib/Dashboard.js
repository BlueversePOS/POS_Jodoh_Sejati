$(document).ready(function () {

    $(".main-header").find(".title").html("Dashboard");

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

    const dtValues = [
        { DATE: "Jul 30, 2023 - Aug 05, 2023", GROSS_SALES: "Rp18.000", REFUNDS: "Rp0", DISCOUNTS: "Rp0", NET_SALES: "Rp18.000", COST_OF_GOODS: "Rp15.000", GROSS_PROFIT: "Rp3.000" },
        { DATE: "Jul 23, 2023 - Jul 29, 2023", GROSS_SALES: "Rp0", REFUNDS: "Rp0", DISCOUNTS: "Rp0", NET_SALES: "Rp0", COST_OF_GOODS: "Rp0", GROSS_PROFIT: "Rp0" },
        { DATE: "Jul 16, 2023 - Jul 22, 2023", GROSS_SALES: "Rp0", REFUNDS: "Rp0", DISCOUNTS: "Rp0", NET_SALES: "Rp0", COST_OF_GOODS: "Rp0", GROSS_PROFIT: "Rp0" },
        { DATE: "Jul 09, 2023 - Jul 15, 2023", GROSS_SALES: "Rp0", REFUNDS: "Rp0", DISCOUNTS: "Rp0", NET_SALES: "Rp0", COST_OF_GOODS: "Rp0", GROSS_PROFIT: "Rp0" },
        { DATE: "Jul 07, 2023 - Jul 08, 2023", GROSS_SALES: "Rp0", REFUNDS: "Rp0", DISCOUNTS: "Rp0", NET_SALES: "Rp0", COST_OF_GOODS: "Rp0", GROSS_PROFIT: "Rp0" },
    ];

    new Chart("line-chart", {
        type: "line",
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

    GetData();

    function GetData() {
        try {
            $('#table_export tbody').empty();
            $('#table_export').DataTable().destroy();

            dtTable = $('#table_export').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    {
                        data: 'DATE',
                        className: 'no-wrap'
                    },
                    { data: 'GROSS_SALES' },
                    { data: 'REFUNDS' },
                    { data: 'DISCOUNTS' },
                    { data: 'NET_SALES' },
                    { data: 'COST_OF_GOODS' },
                    { data: 'GROSS_PROFIT' }
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

    placeHolder = '<span><i class="fa fa-user pr-2"></i>All Employees</span>';
    $("#employees").select2({
        dropdownParent: $("#employees").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        escapeMarkup: function (m) {
            return m;
        }
    });

});