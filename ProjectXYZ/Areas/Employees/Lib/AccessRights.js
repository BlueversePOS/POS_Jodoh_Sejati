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
        $('#Role_ID').val("");
        $('#ACCESS_NAME').val("");
        $('.switch').find("input[type=checkbox]").prop("checked", false);
    }

    function GetDetailData() {
        try {
            var Role_ID = emptyStr($('#Role_ID').val()) ? "" : $('#Role_ID').val();

            $.ajax({
                url: rootUrl + "Employees/AccessRights/GetAccessRightDetail",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    Role_ID: Role_ID
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Role_ID = emptyStr(value.Role_ID) ? "" : value.Role_ID.trim(),
                                Role_Name = emptyStr(value.Role_Name) ? "" : value.Role_Name.trim(),
                                POS_Flag = emptyStr(value.POS_Flag) ? 0 : value.POS_Flag,
                                POS_AccessPayments = emptyStr(value.POS_AccessPayments) ? 0 : value.POS_AccessPayments,
                                POS_ApplyDiscount = emptyStr(value.POS_ApplyDiscount) ? 0 : value.POS_ApplyDiscount,
                                POS_ChangeTaxes = emptyStr(value.POS_ChangeTaxes) ? 0 : value.POS_ChangeTaxes,
                                POS_ViewReceipt = emptyStr(value.POS_ViewReceipt) ? 0 : value.POS_ViewReceipt,
                                POS_ReprintSendReceipt = emptyStr(value.POS_ReprintSendReceipt) ? 0 : value.POS_ReprintSendReceipt,
                                POS_ViewShift = emptyStr(value.POS_ViewShift) ? 0 : value.POS_ViewShift,
                                POS_ManageItemsPOS = emptyStr(value.POS_ManageItemsPOS) ? 0 : value.POS_ManageItemsPOS,
                                POS_ViewCostPOS = emptyStr(value.POS_ViewCostPOS) ? 0 : value.POS_ViewCostPOS,
                                POS_ChangeSetting = emptyStr(value.POS_ChangeSetting) ? 0 : value.POS_ChangeSetting,
                                BckOffice_Flag = emptyStr(value.BckOffice_Flag) ? 0 : value.BckOffice_Flag,
                                BckOffice_ViewSales = emptyStr(value.BckOffice_ViewSales) ? 0 : value.BckOffice_ViewSales,
                                BckOffice_ManageItemsOff = emptyStr(value.BckOffice_ManageItemsOff) ? 0 : value.BckOffice_ManageItemsOff,
                                BckOffice_ViewCostOff = emptyStr(value.BckOffice_ViewCostOff) ? 0 : value.BckOffice_ViewCostOff,
                                BckOffice_ManageEmployee = emptyStr(value.BckOffice_ManageEmployee) ? 0 : value.BckOffice_ManageEmployee,
                                BckOffice_ManageCustomers = emptyStr(value.BckOffice_ManageCustomers) ? 0 : value.BckOffice_ManageCustomers,
                                BckOffice_EditSetting = emptyStr(value.BckOffice_EditSetting) ? 0 : value.BckOffice_EditSetting,
                                BckOffice_ManagePayTypes = emptyStr(value.BckOffice_ManagePayTypes) ? 0 : value.BckOffice_ManagePayTypes,
                                BckOffice_ManageTaxes = emptyStr(value.BckOffice_ManageTaxes) ? 0 : value.BckOffice_ManageTaxes,
                                BckOffice_POSDevices = emptyStr(value.BckOffice_POSDevices) ? 0 : value.BckOffice_POSDevices;

                            $('#ACCESS_NAME').val(Role_Name).trigger('focus');
                            $('#ACCESS_POS').prop('checked', POS_Flag);
                            $('#accept_payments').prop('checked', POS_AccessPayments);
                            $('#apply_discount').prop('checked', POS_ApplyDiscount);
                            $('#change_taxes').prop('checked', POS_ChangeTaxes);
                            $('#view_receipt').prop('checked', POS_ViewReceipt);
                            $('#reprintresend_receipt').prop('checked', POS_ReprintSendReceipt);
                            $('#view_shiftreport').prop('checked', POS_ViewShift);
                            $('#manage_items').prop('checked', POS_ManageItemsPOS);
                            $('#view_costitems').prop('checked', POS_ViewCostPOS);
                            $('#change_setting').prop('checked', POS_ChangeSetting);
                            $('#ACCESS_BACKOFFICE').prop('checked', BckOffice_Flag);
                            $('#view_sreport').prop('checked', BckOffice_ViewSales);
                            $('#manage_itemsBOFF').prop('checked', BckOffice_ManageItemsOff);
                            $('#view_costitemsBOFF').prop('checked', BckOffice_ViewCostOff);
                            $('#manage_employees').prop('checked', BckOffice_ManageEmployee);
                            $('#manage_customers').prop('checked', BckOffice_ManageCustomers);
                            $('#edit_gnlsetting').prop('checked', BckOffice_EditSetting);
                            $('#manage_paymenttypes').prop('checked', BckOffice_ManagePayTypes);
                            $('#manage_taxes').prop('checked', BckOffice_ManageTaxes);
                            $('#manage_posDevice').prop('checked', BckOffice_POSDevices);
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

    $('#btnAddRole').on("click", function () {
        try {
            $(".listRole").hide();
            $(".addRole").show();
            ClearValues();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_access tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Role_ID = currow.find('td:eq(0) input').val();
            ClearValues();
            $('#Role_ID').val(Role_ID);
            $(".listRole").hide();
            $(".addRole").show();
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