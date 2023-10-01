$(document).ready(function () {

    const dtValues = [
        { INV_DATE: "2023-09-19 09:27:00", INV_ITEM: "Caramel machiato", INV_STORE: "JS STORE", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Receive items #SA1001", INV_ADJUSMENT: 2, INV_STORCKAFTER: 2 },
        { INV_DATE: "2023-09-19 09:26:00", INV_ITEM: "Caramel machiato", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1002", INV_ADJUSMENT: -2, INV_STORCKAFTER: 95 },
        { INV_DATE: "2023-09-19 08:31:00", INV_ITEM: "Kopi susu", INV_STORE: "JS STORE", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1001", INV_ADJUSMENT: 2, INV_STORCKAFTER: 2 },
        { INV_DATE: "2023-09-19 08:31:00", INV_ITEM: "Kopi susu", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1001", INV_ADJUSMENT: -2, INV_STORCKAFTER: 95 },
    ];

    $(".main-header").find(".title").html("Inventory History");

    Clear();

    function Clear() {
        $('select').val("");
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_invhistory tbody').empty();
            $('#table_invhistory').DataTable().destroy();

            dtTable = $('#table_invhistory').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    {
                        data: 'INV_DATE',
                        render: function (data, type, row) {
                            var date = emptyStr(data) ? "" : moment(data).format("MMM DD, YYYY hh:mm");
                            return date;
                        }
                    },
                    { data: 'INV_ITEM' },
                    { data: 'INV_STORE' },
                    { data: 'INV_SITE' },
                    { data: 'INV_EMPLOYEE' },
                    { data: 'INV_REASON' },
                    { data: 'INV_ADJUSMENT' },
                    { data: 'INV_STORCKAFTER' }
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
            $('#table_invhistory').attr('style', 'width: 100%');
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

    var placeHolder = '<span><i class="fas fa-store-alt pr-2"></i>All stores</span>';
    $("#stores").select2({
        dropdownParent: $("#stores").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        escapeMarkup: function (m) {
            return m;
        }
    });

    placeHolder = '<span><i class="fas fa-warehouse pr-2"></i>All sites</span>';
    $("#sites").select2({
        dropdownParent: $("#sites").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        escapeMarkup: function (m) {
            return m;
        }
    });

    placeHolder = '<span><i class="fa fa-user pr-2"></i>All employees</span>';
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

    placeHolder = '<span><i class="fas fa-bars pr-2"></i>All reasons</span>';
    $("#reason").select2({
        dropdownParent: $("#reason").parent(),
        placeholder: placeHolder,
        multiple: false,
        allowClear: true,
        width: "100%",
        escapeMarkup: function (m) {
            return m;
        }
    });

    $('select').on("select2:open", function () {
        $(this).parents('.form-group').addClass('focused');
    });

    $('select').on("select2:close", function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parents('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

});