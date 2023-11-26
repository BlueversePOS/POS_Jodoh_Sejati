$(document).ready(function () {

    const dtValues = [
        { ID: "1", ACCESS_NAME: "Owner", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 1 },
        { ID: "2", ACCESS_NAME: "Administrator", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 0 },
        { ID: "3", ACCESS_NAME: "Manager", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 0 },
        { ID: "4", ACCESS_NAME: "Cashier", ACCESS_POS: 1, ACCESS_BACKOFFICE: 0, ACCESS_EMPLOYEES: 0 }
    ];

    $(".main-header").find(".title").html("Employee List");

    Clear();

    function Clear() {
        $(".listRole").show();
        $(".addRole").hide();
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
            $('#table_access tbody').empty();
            $('#table_access').DataTable().destroy();

            dtTable = $('#table_access').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'AccessRights/GetAccessRight',
                    "datatype": "json",
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
                        data: 'Role_ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Role_Name',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            var back = ["orange", "blue", "purple", "green"];
                            var dtColor = back[Math.floor(Math.random() * back.length)];
                            if (!emptyStr(dtVal)) {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes bg-" + dtColor + " mr-4 text-center text-white pt-1' style='border-radius: 50%;'><i class='fas fa-user-friends'></i></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label></div></div>";
                            }
                            return values;
                        }
                    },
                    { data: 'Access' },
                    {
                        data: 'Access_Employee',
                        className: 'text-right'
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
                }
            });
            $('#table_access').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#ACCESS_NAME').val("");
        $('.switch').find("input[type=checkbox]").prop("checked", false);
    }

    function Save() {
        try {
            var Role_ID = emptyStr($('#Role_ID').val()) ? "" : $('#Role_ID').val(),
                Role_Name = emptyStr($('#ACCESS_NAME').val()) ? "" : $('#ACCESS_NAME').val(),
                POS_Flag = $('#ACCESS_POS').is(':checked') ? 1 : 0,
                POS_AccessPayments = $('#accept_payments').is(':checked') ? 1 : 0,
                POS_ApplyDiscount = $('#apply_discount').is(':checked') ? 1 : 0,
                POS_ChangeTaxes = $('#change_taxes').is(':checked') ? 1 : 0,
                POS_ViewReceipt = $('#view_receipt').is(':checked') ? 1 : 0,
                POS_ReprintSendReceipt = $('#reprintresend_receipt').is(':checked') ? 1 : 0,
                POS_ViewShift = $('#view_shiftreport').is(':checked') ? 1 : 0,
                POS_ManageItemsPOS = $('#manage_items').is(':checked') ? 1 : 0,
                POS_ViewCostPOS = $('#view_costitems').is(':checked') ? 1 : 0,
                POS_ChangeSetting = $('#change_setting').is(':checked') ? 1 : 0,
                BckOffice_Flag = $('#ACCESS_BACKOFFICE').is(':checked') ? 1 : 0,
                BckOffice_ViewSales = $('#view_sreport').is(':checked') ? 1 : 0,
                BckOffice_ManageItemsOff = $('#manage_itemsBOFF').is(':checked') ? 1 : 0,
                BckOffice_ViewCostOff = $('#view_costitemsBOFF').is(':checked') ? 1 : 0,
                BckOffice_ManageEmployee = $('#manage_employees').is(':checked') ? 1 : 0,
                BckOffice_ManageCustomers = $('#manage_customers').is(':checked') ? 1 : 0,
                BckOffice_EditSetting = $('#edit_gnlsetting').is(':checked') ? 1 : 0,
                BckOffice_ManagePayTypes = $('#manage_paymenttypes').is(':checked') ? 1 : 0,
                BckOffice_ManageTaxes = $('#manage_taxes').is(':checked') ? 1 : 0,
                BckOffice_POSDevices = $('#manage_posDevice').is(':checked') ? 1 : 0;
            var model = {
                Role_ID: Role_ID,
                Role_Name: Role_Name,
                POS_Flag: POS_Flag,
                POS_AccessPayments: POS_AccessPayments,
                POS_ApplyDiscount: POS_ApplyDiscount,
                POS_ChangeTaxes: POS_ChangeTaxes,
                POS_ViewReceipt: POS_ViewReceipt,
                POS_ReprintSendReceipt: POS_ReprintSendReceipt,
                POS_ViewShift: POS_ViewShift,
                POS_ManageItemsPOS: POS_ManageItemsPOS,
                POS_ViewCostPOS: POS_ViewCostPOS,
                POS_ChangeSetting: POS_ChangeSetting,
                BckOffice_Flag: BckOffice_Flag,
                BckOffice_ViewSales: BckOffice_ViewSales,
                BckOffice_ManageItemsOff: BckOffice_ManageItemsOff,
                BckOffice_ViewCostOff: BckOffice_ViewCostOff,
                BckOffice_ManageEmployee: BckOffice_ManageEmployee,
                BckOffice_ManageCustomers: BckOffice_ManageCustomers,
                BckOffice_EditSetting: BckOffice_EditSetting,
                BckOffice_ManagePayTypes: BckOffice_ManagePayTypes,
                BckOffice_ManageTaxes: BckOffice_ManageTaxes,
                BckOffice_POSDevices: BckOffice_POSDevices
            }

            var form = $('#FormRole');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Employees/AccessRights/SaveAccessRight',
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
                        swal({ type: "success", title: "Success", text: "Role " + Role_Name + " saved successfully" });
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

    $('#btnAddRole').on("click", function () {
        try {
            $(".listRole").hide();
            $(".addRole").show();
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

    $('#btnSave').on("click", function () {
        try {
            //e.preventDefault();
            var IsValid = true;
            var Role_Name = emptyStr($('#ACCESS_NAME').val()) ? "" : $('#ACCESS_NAME').val();

            if (emptyStr(Role_Name)) {
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