$(document).ready(function () {
    const dtValuesPT = [
        { ID: 1, PAYMENT_TYPE: 1, PAYMENT_NAME: "Card" },
        { ID: 2, PAYMENT_TYPE: 2, PAYMENT_NAME: "Cash" }
    ];
    const dtValuesPD = [
        { ID: 1, DEVICE_NAME: "POS 1", DEVICE_STATUS: 1 }
    ];
    const dtValuesTAX = [
        { ID: 1, TAXES_NAME: "PPN 10%", TAXES_OPTION: 1, TAXES_RATE: 10 }
    ];
    //dtValuesTAX.length = 0;
    const dtValuesST = [
        { SALESTYPE_ID: 1, SALESTYPE_NAME: "Walk In" },
        { SALESTYPE_ID: 2, SALESTYPE_NAME: "Online" }
    ];
    const dtValuesSTO = [
        { ID: 1, STORES_NAME: "PokeToys", STORES_ADDRESS: "" }
    ];
    const dtValuesSITE = [
        { SITE_ID: "GD001", SITE_NAME: "Gudang Display", STORES_ID: "PokeToys" }
    ];
    var validCodes = [8, 9, 13, 46, 37, 39, 46, 18, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];

    //#region FUNCTION

    Clear();

    function Clear() {
        $(".divSetting").hide();
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

    function GetNumberMaster(hasil) {
        try {
            var ID = "";
            $.ajax({
                url: rootUrl + "Setting/Settings/GetNumberMaster",
                type: "POST",
                async: false,
                dataType: "json",
                data: { 'param': hasil },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var NEWNUMBER = emptyStr(value.NEWNUMBER) ? "" : value.NEWNUMBER.trim();
                            ID = NEWNUMBER;
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
            return ID;
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    //#region Payment Type

    function ClearPaymentType() {
        $('#Payment_ID').val("");
        $('#Payment_Name').val("").parent('.form-group').removeClass('focused');
        $('#Payment_Type').val("");
        $('#AllStores').prop('checked', false);
    }

    function GetDataPayment() {
        try {
            $('#table_paymenttypes tbody').empty();
            $('#table_paymenttypes').DataTable().destroy();

            dtTable = $('#table_paymenttypes').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataPaymentType',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                        data: 'Payment_ID',
                        orderable: false,
                        className: "text-center",
                        width: "1px",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data.trim();
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'Payment_Name' }
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
            $('#table_paymenttypes').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataStorePayment() {
        try {
            var Payment_ID = emptyStr($('#Payment_ID').val()) ? "" : $('#Payment_ID').val();
            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataStoresDDL",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    Prefix: ""
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    $('#treeview > li').find('ul').empty();
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim();
                            var Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim();

                            var html = '<li>' +
                                '<input type="checkbox" id="' + Store_ID + '" class="tree-node" value="' + Store_ID + '" />' +
                                '<label class="font-weight-normal pl-3" for="' + Store_ID + '">' + Store_Name + '</label>' +
                                '</li>';
                            $('#treeview > li').find('ul').append(html);
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
            }).done(function () {
                if (!emptyStr(Payment_ID)) {
                    GetDetailsPayment();
                }
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsPayment() {
        try {
            var Payment_ID = emptyStr($('#Payment_ID').val()) ? "" : $('#Payment_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataPaymentType",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: Payment_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Payment_ID = emptyStr(value.Payment_ID) ? "" : value.Payment_ID.trim(),
                                Payment_Type = emptyStr(value.Payment_Type) ? 0 : value.Payment_Type,
                                Payment_Name = emptyStr(value.Payment_Name) ? "" : value.Payment_Name.trim(),
                                LineItem = emptyStr(value.LineItem) ? 0 : value.LineItem,
                                AllStore = emptyStr(value.AllStore) ? 0 : value.AllStore,
                                Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim();

                            $('#Payment_ID').val(Payment_ID);
                            $('#Payment_Name').val(Payment_Name);
                            $('#Payment_Type').val(Payment_Type);
                            $('#AllStores').prop('checked', AllStore);
                            if (!emptyStr(Store_ID)) {
                                $('#treeview').find('.tree-node#' + Store_ID).prop('checked', true).trigger('change');
                            }
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

    function SavePaymentType() {
        try {
            var Payment_ID = emptyStr($('#Payment_ID').val()) ? "" : $('#Payment_ID').val(),
                Payment_Name = emptyStr($('#Payment_Name').val()) ? "" : $('#Payment_Name').val(),
                Payment_Type = emptyStr($('#Payment_Type').val()) ? "" : $('#Payment_Type').val(),
                AllStore = $('#AllStores').is(':checked') ? 1 : 0;

            var payStore = [];
            var lineitem = 0;
            $.each($('.tree-node'), function () {
                var checked = $(this).is(':checked');
                var id = $(this).attr('id');
                var Store_ID = $(this).val();
                var Store_Name = $('label[for="' + id + '"]').text();
                if (checked) {
                    payStore.push({
                        LineItem: parseInt(lineitem) + 1,
                        AllStore: AllStore,
                        Store_ID: Store_ID,
                        Store_Name: Store_Name
                    });
                }
            });

            var model = {
                Payment_ID: Payment_ID,
                Payment_Name: Payment_Name,
                Payment_Type: Payment_Type,
                AllStore: AllStore,
                payStore: payStore
            }

            var form = $('#FormPayType');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SavePaymentType',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".paymentList").show();
                        $(".paymentAdd").hide();
                        GetDataPayment();
                        swal({ type: "success", title: "Success", text: "Payment type " + Payment_Name + " saved successfully" });
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

    //#endregion

    //#region Devices

    function ClearDevices() {
        $('#POS_Device_ID').val("");
        $('#POS_Device_Name').val("").parent('.form-group').removeClass('focused');
        $('#DEVICE_STOREID :selected').val("");
        $('#DEVICE_STOREID').val("").trigger('select2:close');
        $('#DEVICE_STOREID').html("");
    }

    function GetDataDevices() {
        try {
            $('#table_POSDevices tbody').empty();
            $('#table_POSDevices').DataTable().destroy();

            dtTable = $('#table_POSDevices').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataDevices',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                        data: 'POS_Device_ID',
                        orderable: false,
                        width: "1px",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'POS_Device_Name' }
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
            $('#table_POSDevices').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsDevices() {
        try {
            var POS_Device_ID = emptyStr($('#POS_Device_ID').val()) ? "" : $('#POS_Device_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataDevices",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: POS_Device_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var POS_Device_ID = emptyStr(value.POS_Device_ID) ? "" : value.POS_Device_ID.trim(),
                                POS_Device_Name = emptyStr(value.POS_Device_Name) ? "" : value.POS_Device_Name.trim(),
                                Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim();

                            $('#POS_Device_Name').val(POS_Device_Name);
                            var newOption = $("<option selected='selected'></option>").val(Store_ID).text(Store_Name);
                            $('#DEVICE_STOREID').append(newOption).trigger('select2:open');
                            $('.POSdevices').find('.select2').trigger('select2:close');
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

    function SaveDevice() {
        try {
            var POS_Device_ID = emptyStr($('#POS_Device_ID').val()) ? "" : $('#POS_Device_ID').val(),
                POS_Device_Name = emptyStr($('#POS_Device_Name').val()) ? "" : $('#POS_Device_Name').val(),
                Store_ID = emptyStr($('#DEVICE_STOREID').val()) ? "" : $('#DEVICE_STOREID').val(),
                Store_Name = emptyStr($('#DEVICE_STOREID :selected').text()) ? "" : $('#DEVICE_STOREID :selected').text();

            var model = {
                POS_Device_ID: POS_Device_ID,
                POS_Device_Name: POS_Device_Name,
                Store_ID: Store_ID,
                Store_Name: Store_Name
            }

            var form = $('#FormDevice');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveDevice',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".POSList").show();
                        $(".POSAdd").hide();
                        GetDataDevices();
                        swal({ type: "success", title: "Success", text: "Device " + POS_Device_Name + " saved successfully" });
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

    //#endregion

    //#region Taxes

    function ClearTaxes() {
        $('#Tax_ID').val("");
        $('#Tax_Name').val("");
        $('#Tax_Rate').val("");
        $('#Tax_Type').val("");
        $('#Tax_Option').val("");
        $.each($('.form-input'), function () {
            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        });
    }

    function GetDataTaxes() {
        try {
            $('#table_taxes tbody').empty();
            $('#table_taxes').DataTable().destroy();

            dtTable = $('#table_taxes').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataTaxes',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                        data: 'Tax_ID',
                        orderable: false,
                        width: "1%",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data.trim();
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'Tax_Name' },
                    {
                        data: 'Tax_Option',
                        render: function (data, type, row) {
                            var status = emptyStr(data) ? 0 : data;
                            status = status == 1 ? "Yes" : "No";
                            return status;
                        }
                    },
                    {
                        data: 'Tax_Rate',
                        render: function (data, type, row) {
                            var rate = emptyStr(data) ? 0 : data;
                            rate = rate + "%";
                            return rate;
                        }
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
                    if ($('#table_taxes tbody').find('.dataTables_empty').is(':visible')) {
                        $(".taxesEmpty").hide();
                        $(".taxesList").show();
                    }
                }
            });
            $('#table_taxes').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsTaxes() {
        try {
            var Tax_ID = emptyStr($('#Tax_ID').val()) ? "" : $('#Tax_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataTaxes",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: Tax_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Tax_ID = emptyStr(value.Tax_ID) ? "" : value.Tax_ID.trim(),
                                Tax_Name = emptyStr(value.Tax_Name) ? "" : value.Tax_Name.trim(),
                                Tax_Rate = emptyStr(value.Tax_Rate) ? 0 : value.Tax_Rate,
                                Tax_Type = emptyStr(value.Tax_Type) ? 0 : value.Tax_Type,
                                Tax_Option = emptyStr(value.Tax_Option) ? 0 : value.Tax_Option;

                            $('#Tax_ID').val(Tax_ID);
                            $('#Tax_Name').val(Tax_Name);
                            $('#Tax_Rate').val(Tax_Rate);
                            $('#Tax_Type').val(Tax_Type);
                            $('#Tax_Option').val(Tax_Option);
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

    function SaveTaxes() {
        try {
            var Tax_ID = emptyStr($('#Tax_ID').val()) ? "" : $('#Tax_ID').val(),
                Tax_Name = emptyStr($('#Tax_Name').val()) ? "" : $('#Tax_Name').val(),
                Tax_Rate = emptyStr($('#Tax_Rate').val()) ? "" : $('#Tax_Rate').val(),
                Tax_Type = emptyStr($('#Tax_Type').val()) ? "" : $('#Tax_Type').val(),
                Tax_Option = emptyStr($('#Tax_Option').val()) ? "" : $('#Tax_Option').val();

            var model = {
                Tax_ID: Tax_ID,
                Tax_Name: Tax_Name,
                Tax_Rate: Tax_Rate,
                Tax_Type: Tax_Type,
                Tax_Option: Tax_Option
            }

            var form = $('#FormTaxes');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveTaxes',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".taxesEmpty").hide();
                        $(".taxesList").show();
                        $(".taxesAdd").hide();
                        GetDataTaxes();
                        swal({ type: "success", title: "Success", text: "Taxes " + Tax_Name + " saved successfully" });
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

    //#endregion

    //#region Sales Type

    function ClearSales() {
        $('#SALESTYPE_ID').val("");
        $('#SALESTYPE_NAME').val("").parent('.form-group').removeClass('focused');
        $('#SALESTYPE_STOREID :selected').val("");
        $('#SALESTYPE_STOREID').val("").trigger('select2:close');
        $('#SALESTYPE_STOREID').html("");
    }

    function GetDataSales() {
        try {
            $('#table_salestype tbody').empty();
            $('#table_salestype').DataTable().destroy();

            dtTable = $('#table_salestype').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataSalesType',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                        data: 'SalesType_Name',
                        render: function (data, type, row) {
                            var id = emptyStr(row.SalesType_ID) ? "" : row.SalesType_ID.trim();
                            var values = emptyStr(data) ? "" : data.trim();
                            var valDT = '<input type="hidden" value="' + id + '" />' + values;
                            return valDT;
                        }
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
            $('#table_salestype').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsSalesType() {
        try {
            var SALESTYPE_ID = emptyStr($('#SALESTYPE_ID').val()) ? "" : $('#SALESTYPE_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataSalesType",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: SALESTYPE_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var SalesType_ID = emptyStr(value.SalesType_ID) ? "" : value.SalesType_ID.trim(),
                                SalesType_Name = emptyStr(value.SalesType_Name) ? "" : value.SalesType_Name.trim(),
                                Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim();

                            $('#SALESTYPE_NAME').val(SalesType_Name);
                            var newOption = $("<option selected='selected'></option>").val(Store_ID).text(Store_Name);
                            $('#SALESTYPE_STOREID').append(newOption).trigger('select2:open');
                            $('.salestype').find('.select2').trigger('select2:close');
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

    function SaveSalesType() {
        try {
            var SalesType_ID = emptyStr($('#SALESTYPE_ID').val()) ? "" : $('#SALESTYPE_ID').val(),
                SalesType_Name = emptyStr($('#SALESTYPE_NAME').val()) ? "" : $('#SALESTYPE_NAME').val(),
                Store_ID = emptyStr($('#SALESTYPE_STOREID').val()) ? "" : $('#SALESTYPE_STOREID').val(),
                Store_Name = emptyStr($('#SALESTYPE_STOREID :selected').text()) ? "" : $('#SALESTYPE_STOREID :selected').text();

            var model = {
                SalesType_ID: SalesType_ID,
                SalesType_Name: SalesType_Name,
                Store_ID: Store_ID,
                Store_Name: Store_Name
            }

            var form = $('#FormStype');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveSalesType',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".salesList").show();
                        $(".salesAdd").hide();
                        GetDataSales();
                        swal({ type: "success", title: "Success", text: "Sales type " + SalesType_Name + " saved successfully" });
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

    //#endregion

    //#region Stores

    function ClearStores() {
        $('.stores #Store_ID').val("");
        $('#STORE_NAME').val("");
        $('#STORE_ADDRESS').val("");
        $('#STORE_CITY').val("");
        $('#STORE_PROVINCE').val("");
        $('#STORE_POSTALCODE').val("");
        $('#STORE_COUNTRY').val("");
        $('#STORE_PHONE').val("");
        $('#STORE_DESCRIPTION').val("");
        $.each($('.form-input'), function () {
            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        });
    }

    function GetDataStores() {
        try {
            $('#table_stores tbody').empty();
            $('#table_stores').DataTable().destroy();

            dtTable = $('#table_stores').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataStores',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                        data: 'Store_Name',
                        render: function (data, type, row) {
                            var id = emptyStr(row.Store_ID) ? "" : row.Store_ID.trim();
                            var values = emptyStr(data) ? "" : data.trim();
                            var valDT = '<input type="hidden" value="' + id + '" />' + values;
                            return valDT;
                        }
                    },
                    { data: 'FULL_ADDRESS' },
                    {
                        data: 'Store_ID',
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
            $('#table_stores').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsStore() {
        try {
            var Store_ID = emptyStr($('.stores #Store_ID').val()) ? "" : $('.stores #Store_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataStores",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: Store_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim(),
                                Address = emptyStr(value.Address) ? "" : value.Address.trim(),
                                City = emptyStr(value.City) ? "" : value.City.trim(),
                                Province = emptyStr(value.Province) ? "" : value.Province.trim(),
                                Postal_Code = emptyStr(value.Postal_Code) ? "" : value.Postal_Code.trim(),
                                Country = emptyStr(value.Country) ? "" : value.Country.trim(),
                                Phone = emptyStr(value.Phone) ? "" : value.Phone.trim(),
                                Description = emptyStr(value.Description) ? "" : value.Description.trim();

                            $('#STORE_NAME').val(Store_Name);
                            $('#STORE_ADDRESS').val(Address);
                            $('#STORE_CITY').val(City);
                            $('#STORE_PROVINCE').val(Province);
                            $('#STORE_POSTALCODE').val(Postal_Code);
                            $('#STORE_COUNTRY').val(Country);
                            $('#STORE_PHONE').val(Phone);
                            $('#STORE_DESCRIPTION').val(Description);
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

    function SaveStore() {
        try {
            var Store_ID = emptyStr($('.stores #Store_ID').val()) ? "" : $('.stores #Store_ID').val(),
                Store_Name = emptyStr($('#STORE_NAME').val()) ? "" : $('#STORE_NAME').val(),
                Address = emptyStr($('#STORE_ADDRESS').val()) ? "" : $('#STORE_ADDRESS').val(),
                City = emptyStr($('#STORE_CITY').val()) ? "" : $('#STORE_CITY').val(),
                Province = emptyStr($('#STORE_PROVINCE').val()) ? "" : $('#STORE_PROVINCE').val(),
                Postal_Code = emptyStr($('#STORE_POSTALCODE').val()) ? "" : $('#STORE_POSTALCODE').val(),
                Country = emptyStr($('#STORE_COUNTRY').val()) ? "" : $('#STORE_COUNTRY').val(),
                CountryName = emptyStr($('#STORE_COUNTRY :selected').text()) ? "" : $('#STORE_COUNTRY :selected').text(),
                Phone = emptyStr($('#STORE_PHONE').val()) ? "" : $('#STORE_PHONE').val(),
                Description = emptyStr($('#STORE_DESCRIPTION').val()) ? "" : $('#STORE_DESCRIPTION').val();

            var model = {
                Store_ID: Store_ID,
                Store_Name: Store_Name,
                Address: Address,
                City: City,
                Province: Province,
                Postal_Code: Postal_Code,
                Country: Country,
                CountryName: CountryName,
                Phone: Phone,
                Description: Description
            }

            var form = $('#FormStore');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveStore',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".storesList").show();
                        $(".storesAdd").hide();
                        GetDataStores();
                        swal({ type: "success", title: "Success", text: "Store " + Store_Name + " saved successfully" });
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

    //#endregion

    //#region Sites

    function ClearSite() {
        $('#SITE_ID').val("");
        $('#SITE_NAME').val("");
        $('#DefaultSite').prop('checked', false);
        $('.site #STORE_ID :selected').val("");
        $('.site #STORE_ID').val("").trigger('select2:close');
        $('.site #STORE_ID').html("");
        $.each($('.form-input'), function () {
            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        });
    }

    function GetDataSite() {
        try {
            $('#table_site tbody').empty();
            $('#table_site').DataTable().destroy();

            dtTable = $('#table_site').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Setting/Settings/GetDataSites',
                    "datatype": "json",
                    data: { 'ID': "" },
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
                    { data: 'Site_ID' },
                    { data: 'Site_Name' },
                    { data: 'Store_ID' }
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
            $('#table_site').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDetailsSite() {
        try {
            var Site_ID = emptyStr($('#SITE_ID').val()) ? "" : $('#SITE_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataSites",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: Site_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Site_ID = emptyStr(value.Site_ID) ? "" : value.Site_ID.trim(),
                                Site_Name = emptyStr(value.Site_Name) ? "" : value.Site_Name.trim(),
                                Store_ID = emptyStr(value.Store_ID) ? "" : value.Store_ID.trim(),
                                Store_Name = emptyStr(value.Store_Name) ? "" : value.Store_Name.trim(),
                                DefaultSite = emptyStr(value.DefaultSite) ? 0 : value.DefaultSite;

                            $('#SITE_NAME').val(Site_Name);
                            $('#DefaultSite').prop('checked', DefaultSite);
                            var newOption = $("<option selected='selected'></option>").val(Store_ID).text(Store_Name);
                            $('.site #STORE_ID').append(newOption).trigger('select2:open');
                            $('.site').find('.select2').trigger('select2:close');
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

    function SaveSite() {
        try {
            var Site_ID = emptyStr($('#SITE_ID').val()) ? "" : $('#SITE_ID').val(),
                Site_Name = emptyStr($('#SITE_NAME').val()) ? "" : $('#SITE_NAME').val(),
                DefaultSite = $('#DefaultSite').is(":checked") ? 1 : 0,
                Store_ID = emptyStr($('.site #STORE_ID').val()) ? "" : $('.site #STORE_ID').val(),
                Store_Name = emptyStr($('.site #STORE_ID :selected').text()) ? "" : $('.site #STORE_ID :selected').text();

            var model = {
                Site_ID: Site_ID,
                Site_Name: Site_Name,
                DefaultSite: DefaultSite,
                Store_ID: Store_ID,
                Store_Name: Store_Name
            }

            var form = $('#FormSite');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveSite',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        $(".siteList").show();
                        $(".siteAdd").hide();
                        GetDataSite();
                        swal({ type: "success", title: "Success", text: "Site " + Site_Name + " saved successfully" });
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

    //#endregion

    //#region Features

    function GetDataFeatures() {
        try {
            var Feature_ID = emptyStr($('#Feature_ID').val()) ? "" : $('#Feature_ID').val();

            $.ajax({
                url: rootUrl + "Setting/Settings/GetDataFeatures",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    ID: Feature_ID
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Feature_ID = emptyStr(value.Feature_ID) ? "" : value.Feature_ID.trim(),
                                Feature_Shift = emptyStr(value.Feature_Shift) ? 0 : value.Feature_Shift,
                                Feature_TimeClock = emptyStr(value.Feature_TimeClock) ? 0 : value.Feature_TimeClock,
                                Feature_LowStock = emptyStr(value.Feature_LowStock) ? 0 : value.Feature_LowStock,
                                Feature_NegativeStock = emptyStr(value.Feature_NegativeStock) ? 0 : value.Feature_NegativeStock;

                            $('#Shifts').prop('checked', Feature_Shift);
                            $('#TimeClock').prop('checked', Feature_TimeClock);
                            $('#LowStock').prop('checked', Feature_LowStock);
                            $('#NegativeStock').prop('checked', Feature_NegativeStock);
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

    function SaveFeatures() {
        try {
            var Feature_ID = emptyStr($('#Feature_ID').val()) ? "" : $('#Feature_ID').val(),
                Feature_Shift = $('#Shifts').is(':checked') ? 1 : 0,
                Feature_TimeClock = $('#TimeClock').is(':checked') ? 1 : 0,
                Feature_LowStock = $('#LowStock').is(':checked') ? 1 : 0,
                Feature_NegativeStock = $('#NegativeStock').is(':checked') ? 1 : 0;

            var model = {
                Feature_ID: Feature_ID,
                Feature_Shift: Feature_Shift,
                Feature_TimeClock: Feature_TimeClock,
                Feature_LowStock: Feature_LowStock,
                Feature_NegativeStock: Feature_NegativeStock
            }

            var form = $('#FormFeatures');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Setting/Settings/SaveFeatures',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        GetDataFeatures();
                        swal({ type: "success", title: "Success", text: "Features saved successfully" });
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

    //#endregion

    //#endregion

    //#region EVENT

    $('input').focus(function () {
        try {
            $(this).parent('.form-group').addClass('focused');
            $(this).prop("autocomplete", "off");
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

    $("input[name='number'], input[type='tel']").on("keydown", function (e) {
        var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
        var charStr = String.fromCharCode(charCode);
        if (!validCodes.includes(charCode)) {
            if (!charStr.match(/^[0-9]+$/)) {
                e.preventDefault();
            }
        }
    });

    $("input[name='number'], input[type='tel']").on("paste", function (e) {
        var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
        var charStr = String.fromCharCode(charCode);
        if (!validCodes.includes(charCode)) {
            if (!charStr.match(/^[0-9]+$/)) {
                e.preventDefault();
            }
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

    $(".divChoosen").on("click", function () {
        try {
            var nameDiv = $(this).attr("name");
            Clear();
            $(".divChoosen").removeClass("active");
            $(this).addClass("active");
            if (!emptyStr(nameDiv)) {
                $("." + nameDiv).show();
                if (nameDiv.toLowerCase() == "payment") {
                    $(".paymentList").show();
                    $(".paymentAdd").hide();
                    GetDataPayment();
                } else if (nameDiv.toLowerCase() == "features") {
                    GetDataFeatures();
                } else if (nameDiv.toLowerCase() == "posdevices") {
                    $(".POSList").show();
                    $(".POSAdd").hide();
                    GetDataDevices();
                } else if (nameDiv.toLowerCase() == "taxes") {
                    $(".taxesEmpty").hide();
                    $(".taxesList").show();
                    $(".taxesAdd").hide();
                    GetDataTaxes();
                } else if (nameDiv.toLowerCase() == "salestype") {
                    $(".salesList").show();
                    $(".salesAdd").hide();
                    GetDataSales();
                } else if (nameDiv.toLowerCase() == "stores") {
                    $(".storesList").show();
                    $(".storesAdd").hide();
                    GetDataStores();
                } else if (nameDiv.toLowerCase() == "site") {
                    $(".siteList").show();
                    $(".siteAdd").hide();
                    GetDataSite();
                }
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on('change', function () {
        try {
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#region Payment Types
    // Show/hide child nodes when a checkbox is clicked
    $("#AllStores").on('change', function () {
        try {
            var isChecked = $(this).is(":checked");
            $(this).siblings("ul").find(".tree-node").prop("checked", isChecked);
            $(this).parents("li").find(".tree-node").prop("checked", isChecked);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#treeview").on('change', '.tree-node', function () {
        try {
            var i = 0;
            var j = 0;
            $("#AllStores").prop('checked', false);
            $.each($('.tree-node'), function () {
                var checked = $(this).is(':checked');
                i = parseInt(i) + 1;
                if (checked) {
                    j = parseInt(j) + 1;
                }
            });
            if (i == j) {
                $("#AllStores").prop('checked', true);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#SALESTYPE_STOREID").select2({
        dropdownParent: $("#SALESTYPE_STOREID").parent(),
        //placeholder: "Select role",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Setting/Settings/GetDataStoresDDL',
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
                            var nilai = obj.Store_ID.trim();
                            var textnilai = obj.Store_Name.trim();
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

    $("#btnAddPayment").on("click", function () {
        try {
            $(".paymentList").hide();
            $(".paymentAdd").show();
            ClearPaymentType();
            GetDataStorePayment();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#store-collapse").on("click", function () {
        try {
            var collapse = $(".store-collapse").is(":visible");
            $(this).addClass("fa-chevron-down");
            $(this).removeClass("fa-chevron-up");
            $(".store-collapse").show();
            if (collapse) {
                $(this).removeClass("fa-chevron-down");
                $(this).addClass("fa-chevron-up");
                $(".store-collapse").hide();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".payment").on("click", "#btnCancel", function () {
        try {
            $(".paymentList").show();
            $(".paymentAdd").hide();
            GetDataPayment();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".payment").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var Payment_ID = emptyStr($('#Payment_ID').val()) ? "" : $('#Payment_ID').val(),
                Payment_Name = emptyStr($('#Payment_Name').val()) ? "" : $('#Payment_Name').val(),
                Payment_Type = emptyStr($('#Payment_Type').val()) ? 0 : $('#Payment_Type').val(),
                AllStore = $('#AllStores').is(':checked') ? 0 : 1;

            if (emptyStr(Payment_Type)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose payment type" });
            }
            if (emptyStr(Payment_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill payment name" });
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
                            SavePaymentType();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_paymenttypes tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Payment_ID = currow.find('td:eq(0) input').val();
            $(".paymentList").hide();
            $(".paymentAdd").show();
            ClearPaymentType();
            $('#Payment_ID').val(Payment_ID);
            GetDataStorePayment();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Features

    $(".features").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
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
                            SaveFeatures();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region POS Devices

    $("#DEVICE_STOREID").select2({
        dropdownParent: $("#DEVICE_STOREID").parent(),
        //placeholder: "Select role",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Setting/Settings/GetDataStoresDDL',
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
                            var nilai = obj.Store_ID.trim();
                            var textnilai = obj.Store_Name.trim();
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

    $("#btnAddDevices").on("click", function () {
        try {
            $(".POSList").hide();
            $(".POSAdd").show();
            ClearDevices();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".POSdevices").on("click", "#btnCancel", function () {
        try {
            $(".POSList").show();
            $(".POSAdd").hide();
            GetDataDevices();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".POSdevices").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var POS_Device_ID = emptyStr($('#POS_Device_ID').val()) ? "" : $('#POS_Device_ID').val(),
                POS_Device_Name = emptyStr($('#POS_Device_Name').val()) ? "" : $('#POS_Device_Name').val(),
                Store_ID = emptyStr($('#DEVICE_STOREID').val()) ? "" : $('#DEVICE_STOREID').val(),
                Store_Name = emptyStr($('#DEVICE_STOREID :selected').text()) ? "" : $('#DEVICE_STOREID :selected').text();

            if (emptyStr(Store_ID)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose store ID" });
            }
            if (emptyStr(POS_Device_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill device name" });
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
                            SaveDevice();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_POSDevices tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var POS_Device_ID = currow.find('td:eq(0) input').val();
            $(".POSList").hide();
            $(".POSAdd").show();
            ClearDevices();
            $('#POS_Device_ID').val(POS_Device_ID);
            GetDetailsDevices();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Taxes

    $("#btnAddTax, #btnAddTaxes").on("click", function () {
        try {
            $(".taxesEmpty").hide();
            $(".taxesList").hide();
            $(".taxesAdd").show();
            ClearTaxes();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".taxes").on("click", "#btnCancel", function () {
        try {
            $(".taxesEmpty").hide();
            $(".taxesList").show();
            $(".taxesAdd").hide();
            GetDataTaxes();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".taxes").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var Tax_ID = emptyStr($('#Tax_ID').val()) ? "" : $('#Tax_ID').val(),
                Tax_Name = emptyStr($('#Tax_Name').val()) ? "" : $('#Tax_Name').val(),
                Tax_Rate = emptyStr($('#Tax_Rate').val()) ? "" : $('#Tax_Rate').val(),
                Tax_Type = emptyStr($('#Tax_Type').val()) ? "" : $('#Tax_Type').val(),
                Tax_Option = emptyStr($('#Tax_Option').val()) ? "" : $('#Tax_Option').val();

            if (emptyStr(Tax_Rate)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill tax rate" });
            }
            if (emptyStr(Tax_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill tax name" });
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
                            SaveTaxes();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_taxes tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Tax_ID = currow.find('td:eq(0) input').val();
            $(".taxesEmpty").hide();
            $(".taxesList").hide();
            $(".taxesAdd").show();
            ClearTaxes();
            $('#Tax_ID').val(Tax_ID);
            GetDetailsTaxes();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Sales Type

    $("#btnAddSalesType").on("click", function () {
        try {
            $(".salesList").hide();
            $(".salesAdd").show();
            ClearSales();
            var model = {
                'TABLE': 'POS_Set_SalesType',
                'FIELD': 'SalesType_ID',
                'DOCID': 'STYP'
            }
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);
            var NEWNUMBER = GetNumberMaster(hasil);
            $('#SALESTYPE_ID').val(NEWNUMBER).parent('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".salestype").on("click", "#btnCancel", function () {
        try {
            $(".salesList").show();
            $(".salesAdd").hide();
            GetDataSales();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".salestype").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var SalesType_ID = emptyStr($('#SALESTYPE_ID').val()) ? "" : $('#SALESTYPE_ID').val(),
                SalesType_Name = emptyStr($('#SALESTYPE_NAME').val()) ? "" : $('#SALESTYPE_NAME').val(),
                Store_ID = emptyStr($('#SALESTYPE_STOREID').val()) ? "" : $('#SALESTYPE_STOREID').val(),
                Store_Name = emptyStr($('#SALESTYPE_STOREID :selected').text()) ? "" : $('#SALESTYPE_STOREID :selected').text();

            if (emptyStr(Store_ID)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose store ID" });
            }
            if (emptyStr(SalesType_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill sales type name" });
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
                            SaveSalesType();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_salestype tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var SALESTYPE_ID = currow.find('td:eq(0) input').val();
            $(".salesList").hide();
            $(".salesAdd").show();
            ClearSales();
            $('#SALESTYPE_ID').val(SALESTYPE_ID);
            GetDetailsSalesType();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Stores

    $("#btnAddStore").on("click", function () {
        try {
            $(".storesList").hide();
            $(".storesAdd").show();
            ClearStores();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".stores").on("click", "#btnCancel", function () {
        try {
            $(".storesList").show();
            $(".storesAdd").hide();
            GetDataStores();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".stores").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var Store_ID = emptyStr($('.stores #Store_ID').val()) ? "" : $('.stores #Store_ID').val(),
                Store_Name = emptyStr($('#STORE_NAME').val()) ? "" : $('#STORE_NAME').val(),
                Address = emptyStr($('#STORE_ADDRESS').val()) ? "" : $('#STORE_ADDRESS').val(),
                City = emptyStr($('#STORE_CITY').val()) ? "" : $('#STORE_CITY').val(),
                Province = emptyStr($('#STORE_PROVINCE').val()) ? "" : $('#STORE_PROVINCE').val(),
                Postal_Code = emptyStr($('#STORE_POSTALCODE').val()) ? "" : $('#STORE_POSTALCODE').val(),
                Country = emptyStr($('#STORE_COUNTRY').val()) ? "" : $('#STORE_COUNTRY').val(),
                Phone = emptyStr($('#STORE_PHONE').val()) ? "" : $('#STORE_PHONE').val(),
                Description = emptyStr($('#STORE_DESCRIPTION').val()) ? "" : $('#STORE_DESCRIPTION').val();

            if (emptyStr(Phone)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose phone" });
            }
            if (emptyStr(Country)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose country" });
            }
            if (emptyStr(Address)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill store address" });
            }
            if (emptyStr(Store_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill store name" });
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
                            SaveStore();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_stores tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Store_ID = currow.find('td:eq(0) input').val();
            $(".storesList").hide();
            $(".storesAdd").show();
            ClearStores();
            $('.stores #Store_ID').val(Store_ID);
            GetDetailsStore();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Site

    $(".site #STORE_ID").select2({
        dropdownParent: $(".site #STORE_ID").parent(),
        //placeholder: "Select role",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Setting/Settings/GetDataStoresDDL',
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
                            var nilai = obj.Store_ID.trim();
                            var textnilai = obj.Store_Name.trim();
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

    $("#btnAddSite").on("click", function () {
        try {
            $(".siteList").hide();
            $(".siteAdd").show();
            ClearSite();
            var model = {
                'TABLE': 'POS_Set_Site',
                'FIELD': 'Site_ID',
                'DOCID': 'SITE'
            }
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);
            var NEWNUMBER = GetNumberMaster(hasil);
            $('#SITE_ID').val(NEWNUMBER).parent('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".site").on("click", "#btnCancel", function () {
        try {
            $(".siteList").show();
            $(".siteAdd").hide();
            GetDataSite();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".site").on("click", "#btnSave", function () {
        try {
            var IsValid = true;
            var Site_ID = emptyStr($('#SITE_ID').val()) ? "" : $('#SITE_ID').val(),
                Site_Name = emptyStr($('#SITE_NAME').val()) ? "" : $('#SITE_NAME').val(),
                DefaultSite = $('#DefaultSite').is(":checked") ? 1 : 0,
                Store_ID = emptyStr($('.site #STORE_ID').val()) ? "" : $('.site #STORE_ID').val(),
                Store_Name = emptyStr($('.site #STORE_ID :selected').text()) ? "" : $('.site #STORE_ID :selected').text();

            if (emptyStr(Store_ID)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose store ID" });
            }
            if (emptyStr(Site_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill site name" });
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
                            SaveSite();
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_site tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Site_ID = currow.find('td:eq(0)').text().trim();
            $(".siteList").hide();
            $(".siteAdd").show();
            ClearSite();
            $('#SITE_ID').val(Site_ID);
            GetDetailsSite();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#endregion

});