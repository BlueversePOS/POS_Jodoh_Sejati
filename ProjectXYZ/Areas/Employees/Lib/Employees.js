$(document).ready(function () {

    const dtValues = [
        { ID: "1", EMPLOYEE_NAME: "Owner", EMPLOYEE_EMAIL: "wayne.neymar@gmail.com", EMPLOYEE_PHONE: "", EMPLOYEE_ROLE: "Owner"  }
    ];

    $(".main-header").find(".title").html("Employee List");

    Clear();

    function Clear() {
        $(".listEmployees").show();
        $(".addEmployees").hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_employees tbody').empty();
            $('#table_employees').DataTable().destroy();

            dtTable = $('#table_employees').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    {
                        data: 'ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'EMPLOYEE_NAME',
                        className: 'no-wrap'
                    },
                    {
                        data: 'EMPLOYEE_EMAIL',
                        className: 'no-wrap'
                    },
                    {
                        data: 'EMPLOYEE_PHONE',
                        render: function (data, type, row) {
                            var dtVal = emptyStr(data) ? "-" : data.trim();

                            return dtVal;
                        }
                    },
                    { data: 'EMPLOYEE_ROLE' }
                ],
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
            $('#table_employees').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#EMPLOYEE_NAME').val("");
        $('#EMPLOYEE_EMAIL').val("");
        $('#EMPLOYEE_PHONE').val("");
        $('#EMPLOYEE_ROLE').val("");
    }

    $('input').focus(function () {
        try {
            $(this).parents('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('input').blur(function () {
        try {
            var inputValue = $(this).val();
            if (emptyStr(inputValue)) {
                $(this).removeClass('filled');
                $(this).parents('.form-group').removeClass('focused');
            } else {
                $(this).addClass('filled');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on("select2:open", function () {
        try {
            $(this).parents('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on("select2:close", function () {
        try {
            var inputValue = $(this).val();
            if (emptyStr(inputValue)) {
                $(this).removeClass('filled');
                $(this).parents('.form-group').removeClass('focused');
            } else {
                $(this).addClass('filled');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddEmployee').on("click", function () {
        try {
            $(".listEmployees").hide();
            $(".addEmployees").show();
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