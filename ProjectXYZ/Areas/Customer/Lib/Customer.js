$(document).ready(function () {

    const dtValues = [];

    $(".main-header").find(".title").html("Customers");

    Clear();

    function Clear() {
        $(".emptyList").hide();
        $(".existsList").show();
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
            var Customer_ID = emptyStr($('#Customer_ID').val()) ? "" : $('#Customer_ID').val();
            var Customer_Code = emptyStr($('#CUSTOMER_CODE').val()) ? "" : $('#CUSTOMER_CODE').val();
            var model = {
                'Customer_ID': Customer_ID,
                'Customer_Code': Customer_Code
            };

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $('#table_customers tbody').empty();
            $('#table_customers').DataTable().destroy();

            dtTable = $('#table_customers').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'Customer/Customer/GetDatalistCustomer',
                    "datatype": "json",
                    //async: false,
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
                        data: 'Customer_Code',
                        render: function (data, type, row) {
                            var ID = emptyStr(row.Customer_ID) ? "" : row.Customer_ID.trim();
                            var Code = emptyStr(data) ? "" : data;
                            return '<input type="hidden" class="Customer_ID" value="' + ID + '" /><span class="w-100">' + Code + '</span>';
                        }
                    },
                    {
                        data: 'Customer_Name',
                        className: 'no-wrap'
                    },
                    {
                        data: 'Address'
                    },
                    {
                        data: 'Phone',
                        className: 'no-wrap'
                    }
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
                },
                initComplete: function (settings, json) {
                    if ($('#table_customers tbody').find('.dataTables_empty').is(':visible')) {
                        $(".emptyList").show();
                        $(".existsList").hide();
                    }
                }
            });
            $('#table_customers').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataCustomer() {
        try {
            var Customer_ID = emptyStr($('#Customer_ID').val()) ? "" : $('#Customer_ID').val();
            var CUSTOMER_CODE = emptyStr($('#CUSTOMER_CODE').val()) ? "" : $('#CUSTOMER_CODE').val();

            var model = {
                'Customer_ID': Customer_ID,
                'Customer_Code': CUSTOMER_CODE
            };

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + "Customer/Customer/GetDataCustomer",
                type: "POST",
                //async: false,
                data: { 'param': hasil },
                dataType: "json",
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Customer_ID = emptyStr(value.Customer_ID) ? "" : value.Customer_ID.trim(),
                                Customer_Name = emptyStr(value.Customer_Name) ? "" : value.Customer_Name.trim(),
                                Email = emptyStr(value.Email) ? "" : value.Email.trim(),
                                Phone = emptyStr(value.Phone) ? "" : value.Phone.trim(),
                                Address = emptyStr(value.Address) ? "" : value.Address.trim(),
                                Country = emptyStr(value.Country) ? "" : value.Country.trim(),
                                Province = emptyStr(value.Province) ? "" : value.Province.trim(),
                                City = emptyStr(value.City) ? "" : value.City.trim(),
                                Postal_Code = emptyStr(value.Postal_Code) ? "" : value.Postal_Code.trim(),
                                Customer_Code = emptyStr(value.Customer_Code) ? "" : value.Customer_Code.trim(),
                                Note = emptyStr(value.Note) ? "" : value.Note.trim();

                            $('#CUSTOMER_NAME').val(Customer_Name);
                            $('#CUSTOMER_EMAIL').val(Email);
                            $('#CUSTOMER_PHONE').val(Phone);
                            $('#CUSTOMER_ADDRESS').val(Address);
                            $('#CUSTOMER_CITY').val(City);
                            $('#CUSTOMER_PROVINCE').val(Province);
                            $('#CUSTOMER_POSTALCODE').val(Postal_Code);
                            $('#CUSTOMER_COUNTRY').val(Country);
                            $('#CUSTOMER_CODE').val(Customer_Code);
                            $('#CUSTOMER_NOTE').val(Note);
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

    function Save() {
        try {
            var Customer_ID = emptyStr($('#Customer_ID').val()) ? "" : $('#Customer_ID').val(),
                CUSTOMER_NAME = emptyStr($('#CUSTOMER_NAME').val()) ? "" : $('#CUSTOMER_NAME').val(),
                CUSTOMER_EMAIL = emptyStr($('#CUSTOMER_EMAIL').val()) ? "" : $('#CUSTOMER_EMAIL').val(),
                CUSTOMER_PHONE = emptyStr($('#CUSTOMER_PHONE').val()) ? "" : $('#CUSTOMER_PHONE').val(),
                CUSTOMER_ADDRESS = emptyStr($('#CUSTOMER_ADDRESS').val()) ? "" : $('#CUSTOMER_ADDRESS').val(),
                CUSTOMER_CITY = emptyStr($('#CUSTOMER_CITY').val()) ? "" : $('#CUSTOMER_CITY').val(),
                CUSTOMER_PROVINCE = emptyStr($('#CUSTOMER_PROVINCE').val()) ? "" : $('#CUSTOMER_PROVINCE').val(),
                CUSTOMER_POSTALCODE = emptyStr($('#CUSTOMER_POSTALCODE').val()) ? "" : $('#CUSTOMER_POSTALCODE').val(),
                CUSTOMER_COUNTRY = emptyStr($('#CUSTOMER_COUNTRY').val()) ? "" : $('#CUSTOMER_COUNTRY').val(),
                CUSTOMER_CODE = emptyStr($('#CUSTOMER_CODE').val()) ? "" : $('#CUSTOMER_CODE').val(),
                CUSTOMER_NOTE = emptyStr($('#CUSTOMER_NOTE').val()) ? "" : $('#CUSTOMER_NOTE').val();

            var model = {
                'Customer_ID': Customer_ID,
                'Customer_Name': CUSTOMER_NAME,
                'Email': CUSTOMER_EMAIL,
                'Phone': CUSTOMER_PHONE,
                'Address': CUSTOMER_ADDRESS,
                'Country': CUSTOMER_COUNTRY,
                'Province': CUSTOMER_PROVINCE,
                'City': CUSTOMER_CITY,
                'Postal_Code': CUSTOMER_POSTALCODE,
                'Customer_Code': CUSTOMER_CODE,
                'Note': CUSTOMER_NOTE
            };

            var form = $('#FormCustomer');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Customer/Customer/SaveCustomer',
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
                        swal({ type: "success", title: "Success", text: "Customer " + CUSTOMER_NAME + " saved successfully" });
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
        $(this).prop("autocomplete", "off");
        $(this).parent('.form-group').addClass('focused');
    });

    $('input').blur(function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parent('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

    $('select').on("select2:open", function () {
        $(this).parent('.form-group').addClass('focused');
    });

    $('select').on("select2:close", function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parent('.form-group').removeClass('focused');
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

    $('#table_customers tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Customer_ID = currow.find('td:eq(0)').find('.Customer_ID').val();
            var CUSTOMER_CODE = currow.find('td:eq(0)').find('span').text();
            $(".emptyList").hide();
            $(".existsList").hide();
            $(".addCustomer").show();
            ClearValues();
            $('#Customer_ID').val(Customer_ID);
            $('#CUSTOMER_CODE').val(CUSTOMER_CODE);
            GetDataCustomer();
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
            var CUSTOMER_NAME = emptyStr($('#CUSTOMER_NAME').val()) ? "" : $('#CUSTOMER_NAME').val(),
                CUSTOMER_EMAIL = emptyStr($('#CUSTOMER_EMAIL').val()) ? "" : $('#CUSTOMER_EMAIL').val(),
                CUSTOMER_ADDRESS = emptyStr($('#CUSTOMER_ADDRESS').val()) ? "" : $('#CUSTOMER_ADDRESS').val(),
                CUSTOMER_POSTALCODE = emptyStr($('#CUSTOMER_POSTALCODE').val()) ? "" : $('#CUSTOMER_POSTALCODE').val(),
                CUSTOMER_CODE = emptyStr($('#CUSTOMER_CODE').val()) ? "" : $('#CUSTOMER_CODE').val();

            if (emptyStr(CUSTOMER_CODE)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill customer code" });
            }
            if (emptyStr(CUSTOMER_POSTALCODE)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose postal code" });
            }
            if (emptyStr(CUSTOMER_ADDRESS)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill address" });
            }
            if (emptyStr(CUSTOMER_EMAIL)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill email" });
            }
            if (emptyStr(CUSTOMER_NAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill name" });
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