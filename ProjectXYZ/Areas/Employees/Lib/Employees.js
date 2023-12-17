$(document).ready(function () {

    const dtValues = [
        { ID: "1", EMPLOYEE_NAME: "Owner", EMPLOYEE_EMAIL: "wayne.neymar@gmail.com", EMPLOYEE_PHONE: "", EMPLOYEE_ROLE: "Owner"  }
    ];

    $(".main-header").find(".title").html("Employee List");

    $("#loading").show();
    Clear();

    function Clear() {
        $(".listEmployees").show();
        $(".addEmployees").hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function FuncEncrypt(plainText) {
        try {
            var hasil;

            $.ajax({
                url: rootUrl + "Home/Encrypt",
                type: "POST",
                async: false,
                dataType: "json",
                data: {
                    model: plainText
                },
                success: function (result) {
                    if (result.success) {
                        hasil = result.data;
                    }
                    else {
                        window.location = rootUrl + "Home/NoAccess?ErrorMessage=" + result.message;
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

            return hasil;
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

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
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Employees/Employees/GetEmployee',
                    "datatype": "json",
                    data: { 'Employee_ID': "" },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
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
                columns: [
                    {
                        data: 'Employee_ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Employee_Name',
                        className: 'no-wrap'
                    },
                    {
                        data: 'Email',
                        className: 'no-wrap'
                    },
                    {
                        data: 'Phone',
                        render: function (data, type, row) {
                            var dtVal = emptyStr(data) ? "-" : data.trim();

                            return dtVal;
                        }
                    },
                    { data: 'Role_Name' }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'px-1'p><'px-1'i>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>',
                    //lengthMenu: "_MENU_",
                    //info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    paginate: {
                        previous: '<',
                        next: '>'
                    }
                }
            });
            $('#table_employees').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailData() {
        try {
            var Employee_ID = emptyStr($('#Employee_ID').val()) ? "" : $('#Employee_ID').val();
            $.ajax({
                url: rootUrl + "Employees/Employees/GetEmployee",
                type: "POST",
                //async: false,
                dataType: "json",
                data: { 'Employee_ID': Employee_ID },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Employee_ID = emptyStr(value.Employee_ID) ? "" : value.Employee_ID.trim(),
                                Employee_Name = emptyStr(value.Employee_Name) ? "" : value.Employee_Name.trim(),
                                Email = emptyStr(value.Email) ? "" : value.Email.trim(),
                                Phone = emptyStr(value.Phone) ? "" : value.Phone.trim(),
                                Role_ID = emptyStr(value.Role_ID) ? "" : value.Role_ID.trim(),
                                Role_Name = emptyStr(value.Role_Name) ? "" : value.Role_Name.trim();

                            $('#EMPLOYEE_NAME').val(Employee_Name);
                            $('#EMPLOYEE_EMAIL').val(Email);
                            $('#EMPLOYEE_PHONE').val(Phone);
                            var newOption = $("<option selected='selected'></option>").val(Role_ID).text(Role_Name);
                            $('#EMPLOYEE_ROLE').append(newOption).trigger('change');
                        });
                        $.each($('.form-input'), function () {
                            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
                            if (!emptyStr($(this).val())) {
                                $(this).parent('.form-group').addClass('focused');
                            }
                        });
                    }
                    else {
                        swal({ type: "error", title: "Error", text: result.message });
                    }
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").fadeOut(1000);
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
    }

    function ClearValues() {
        $('#EMPLOYEE_NAME').val("");
        $('#EMPLOYEE_EMAIL').val("");
        $('#EMPLOYEE_PHONE').val("");
        $('#EMPLOYEE_ROLE').val("").trigger('change');
        $.each($('.form-input'), function () {
            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        });
    }

    function Save() {
        try {
            var Employee_ID = emptyStr($('#Employee_ID').val()) ? "" : $('#Employee_ID').val(),
                EMPLOYEE_NAME = emptyStr($('#EMPLOYEE_NAME').val()) ? "" : $('#EMPLOYEE_NAME').val(),
                EMPLOYEE_EMAIL = emptyStr($('#EMPLOYEE_EMAIL').val()) ? "" : $('#EMPLOYEE_EMAIL').val(),
                EMPLOYEE_PHONE = emptyStr($('#EMPLOYEE_PHONE').val()) ? "" : $('#EMPLOYEE_PHONE').val(),
                EMPLOYEE_ROLE = emptyStr($('#EMPLOYEE_ROLE :selected').val()) ? "" : $('#EMPLOYEE_ROLE :selected').val();
            var model = {
                Employee_ID: Employee_ID,
                Employee_Name: EMPLOYEE_NAME,
                Email: EMPLOYEE_EMAIL,
                Phone: EMPLOYEE_PHONE,
                Role_ID: EMPLOYEE_ROLE
            }

            var form = $('#FormEmployee');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Employees/Employees/SaveEmployee',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        Clear();
                        swal({ type: "success", title: "Success", text: "Employee " + EMPLOYEE_NAME + " saved successfully" });
                    } else {
                        swal("Error", "Error : " + result.message, "error");
                    }
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
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
    }

    $('input').focus(function () {
        try {
            $(this).prop("autocomplete", "off");
            $(this).parent('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('input').blur(function () {
        try {
            var inputValue = $(this).val();
            if (emptyStr(inputValue)) {
                $(this).removeClass('filled');
                $(this).parent('.form-group').removeClass('focused');
            } else {
                $(this).addClass('filled');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on("select2:open", function () {
        try {
            $(this).parent('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on("select2:close", function () {
        try {
            var inputValue = $(this).val();
            if (emptyStr(inputValue)) {
                $(this).removeClass('filled');
                $(this).parent('.form-group').removeClass('focused');
            } else {
                $(this).addClass('filled');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#EMPLOYEE_ROLE").select2({
        dropdownParent: $("#EMPLOYEE_ROLE").parent(),
        //placeholder: "Select role",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Employees/Employees/GetAccessRight',
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
                            var nilai = obj.Role_ID.trim();
                            var textnilai = obj.Role_Name.trim();
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

    $('#table_employees tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Employee_ID = currow.find('td:eq(0) input').val();
            ClearValues();
            $('#Employee_ID').val(Employee_ID);
            $(".listEmployees").hide();
            $(".addEmployees").show();
            GetDetailData();
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

    $('#btnSave').on("click", function () {
        try {
            //e.preventDefault();
            var IsValid = true;
            var Employee_ID = emptyStr($('#Employee_ID').val()) ? "" : $('#Employee_ID').val(),
                EMPLOYEE_NAME = emptyStr($('#EMPLOYEE_NAME').val()) ? "" : $('#EMPLOYEE_NAME').val(),
                EMPLOYEE_EMAIL = emptyStr($('#EMPLOYEE_EMAIL').val()) ? "" : $('#EMPLOYEE_EMAIL').val(),
                EMPLOYEE_PHONE = emptyStr($('#EMPLOYEE_PHONE').val()) ? "" : $('#EMPLOYEE_PHONE').val(),
                EMPLOYEE_ROLE = emptyStr($('#EMPLOYEE_ROLE :selected').val()) ? "" : $('#EMPLOYEE_ROLE :selected').val();

            if (emptyStr(EMPLOYEE_NAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill name" });
            }
            if (emptyStr(EMPLOYEE_EMAIL)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill email" });
            }
            if (emptyStr(EMPLOYEE_PHONE)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill phone" });
            }
            if (emptyStr(EMPLOYEE_ROLE)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please select role" });
            }

            if (IsValid) {
                swal({
                    html: true,
                    title: 'Are you sure want to save this data?',
                    text: "This proccess cannot be undone",
                    type: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                    animation: 'slide-from-top',
                    allowEscapeKey: false,
                    allowOutsideClick: false,
                },
                    function (isConfirm) {
                        if (isConfirm) {
                            Save();
                        }
                    });
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});