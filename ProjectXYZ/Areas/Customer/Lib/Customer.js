$(document).ready(function () {

    const dtValues = [];

    $(".main-header").find(".title").html("Customers");

    Clear();

    function Clear() {
        $(".emptyList").show();
        $(".existsList").hide();
        $(".addCustomer").hide();
        if (dtValues.length > 0) {
            $(".emptyList").hide();
            $(".existsList").show();
        }
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_customers tbody').empty();
            $('#table_customers').DataTable().destroy();

            dtTable = $('#table_customers').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_customers').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#CUSTOMER_NAME').val("");
        $('#CUSTOMER_EMAIL').val("");
        $('#CUSTOMER_PHONE').val("");
        $('#CUSTOMER_ADDRESS').val("");
        $('#CUSTOMER_CITY').val("");
        $('#CUSTOMER_PROVINCE').val("");
        $('#CUSTOMER_POSTALCODE').val("");
        $('#CUSTOMER_COUNTRY').val("");
        $('#CUSTOMER_CODE').val("");
        $('#CUSTOMER_NOTE').val("");
    }

    $('input').focus(function () {
        $(this).parents('.form-group').addClass('focused');
    });

    $('input').blur(function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parents('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
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

    $('#btnAddCustomer, #btnAddCustomers').on("click", function () {
        try {
            $(".emptyList").hide();
            $(".existsList").hide();
            $(".addCustomer").show();
            ClearValues();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCancel').on("click", function () {
        try {
            Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});