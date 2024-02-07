$(document).ready(function () {

    const dtValues = [
        { INV_STOCKADJITEM: "SA1001", INV_DATE: "2023-09-19 00:00:00", INV_REASON: "Receive items", INV_STORE: "JS STORE", INV_SITE: "GD001", QUANTITY: 2 }
    ];

    $(".main-header").find(".title").html("Stock Adjusment");

    var validCodes = [8, 9, 13, 46, 37, 39, 46, 18, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];

    Clear();

    function Clear() {
        $('.listStockAdj').find("select").val(null).trigger("change");
        $('.listStockAdj').show();
        $('.addStockAdj').hide();
        $('.editStockAdj').hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function formatCurrency(curr) {
        curr = parseFloat(curr);
        curr = curr.toFixed(0, 0);
        curr = curr.replace(".", ",");
        curr = ("Rp " + curr).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return curr;
    }

    function delFormatCurrency(curr) {
        var fixed;
        fixed = curr.substr(0, 3);
        curr = curr.replace(fixed, "");
        for (i = 1; curr.length > i * 3; i++) {
            curr = curr.replace(".", "");
        }
        return curr;
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
            var reason = emptyStr($('.listStockAdj').find('#reason').val()) ? "" : $('.listStockAdj').find('#reason').val(),
                store = emptyStr($('.listStockAdj').find('#store').val()) ? "" : $('.listStockAdj').find('#store').val(),
                site = emptyStr($('.listStockAdj').find('#site').val()) ? "" : $('.listStockAdj').find('#site').val();

            var model = {
                Reason: reason,
                Store_ID: store,
                Site_ID: site
            }

            $('#table_stockadjustment tbody').empty();
            $('#table_stockadjustment').DataTable().destroy();

            dtTableAdj = $('#table_stockadjustment').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/AdjGetDataList',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                    { data: 'DOCNUMBER' },
                    {
                        data: 'DOCDATE',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var date = emptyStr(data) ? "" : moment(data).format("YYYY-MM-DD");
                            if (date <= "1900-01-01") {
                                date = "-";
                            } else {
                                date = moment(data).format($("#dafor").val());
                            }
                            return date;
                        }
                    },
                    { data: 'Reason' },
                    { data: 'Store_Name' },
                    { data: 'Site_Name' },
                    {
                        data: 'QUANTITY',
                        className: 'text-right'
                    }
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
            $('#table_stockadjustment').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearNew() {
        //AllItems();
        $('.addStockAdj').find("select").val(null).trigger("change");
        $('.addStockAdj').find('#SA_REASON').val("");
        $('.addStockAdj').find('#SA_SITE').val("");
        $('.addStockAdj').find('#SA_NOTES').val("");
        $('.addStockAdj').find("#sumNotes").text("0 / 500");
    }

    function ClearEdit() {
        $('.editStockAdj').find('#DOCNUMBER').html("");
        $('.editStockAdj').find('#SA_DATEITEM').html("");
        $('.editStockAdj').find('#SA_REASON_TXT').html("");
        $('.editStockAdj').find('#SA_ADJUSTBY').html("");
        $('.editStockAdj').find('#table_site tbody tr').empty();
        $('.editStockAdj').find('#table_site tbody tr').remove();
        $('.editStockAdj').find('#table_SAItemsDetail tbody tr').empty();
        $('.editStockAdj').find('#table_SAItemsDetail tbody tr').remove();
    }

    function AllItems() {
        try {
            var model = {
                Item_Number: "",
                Category_ID: "",
                LowStock: 0
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/GetDataItems',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: "100%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'text-right vertical-middle',
                        "visible": false
                    },
                    {
                        data: 'InStock',
                        orderable: false,
                        className: 'vertical-middle',
                        "visible": false,
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'text-right vertical-middle',
                        "visible": false,
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'text-right vertical-middle',
                        "visible": false
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'deleteitem vertical-middle text-center',
                        "visible": false,
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [0],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_additem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ItemsReceive() {
        try {
            var model = {
                Item_Number: "",
                Category_ID: "",
                LowStock: 0
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/GetDataItems',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' + 
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'instock text-right vertical-middle'
                    },
                    {
                        data: null,
                        orderable: false,
                        className: 'addstock vertical-middle',
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'itemcost text-right vertical-middle',
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'stockafter text-right vertical-middle'
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'deleteitem vertical-middle text-center',
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_additem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ItemsInvCount() {
        try {
            var model = {
                Item_Number: "",
                Category_ID: "",
                LowStock: 0
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/GetDataItems',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: "50%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'expstock text-right vertical-middle'
                    },
                    {
                        data: null,
                        orderable: false,
                        className: 'countstock vertical-middle',
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        "visible": false,
                        className: 'itemcost text-right vertical-middle',
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        "visible": false,
                        className: 'stockafter text-right vertical-middle'
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'deleteitem vertical-middle text-center',
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_additem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ItemsDamage() {
        try {
            var model = {
                Item_Number: "",
                Category_ID: "",
                LowStock: 0
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/GetDataItems',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'instock text-right vertical-middle'
                    },
                    {
                        data: null,
                        orderable: false,
                        className: 'removestock vertical-middle',
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'itemcost text-right vertical-middle',
                        "visible": false,
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'stockafter text-right vertical-middle'
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'deleteitem vertical-middle text-center',
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_additem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ItemsLoss() {
        try {
            var model = {
                Item_Number: "",
                Category_ID: "",
                LowStock: 0
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/GetDataItems',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'instock text-right vertical-middle'
                    },
                    {
                        data: null,
                        orderable: false,
                        className: 'removestock vertical-middle',
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'itemcost text-right vertical-middle',
                        "visible": false,
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'stockafter text-right vertical-middle'
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'deleteitem vertical-middle text-center',
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_additem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function SaveAdj() {
        try {
            var DOCNUMBER = emptyStr($('.addStockAdj').find('#DOCNUMBER').val()) ? "" : $('.addStockAdj').find('#DOCNUMBER').val(),
                DOCDATE = moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
                Site_ID = emptyStr($('.addStockAdj').find('#SA_SITE').val()) ? "" : $('.addStockAdj').find('#SA_SITE').val(),
                Site_Name = emptyStr($('.addStockAdj').find('#SA_SITE :selected').text()) ? "" : $('.addStockAdj').find('#SA_SITE :selected').text(),
                Reason = emptyStr($('.addStockAdj').find('#SA_REASON').val()) ? "" : $('.addStockAdj').find('#SA_REASON').val(),
                Total_Line_Item = 0,
                Notes = emptyStr($('.addStockAdj').find('#SA_NOTES').val()) ? "" : $('.addStockAdj').find('#SA_NOTES').val();

            //#region Items

            var items = [];
            var Lineitmseq = 0;
            $.each($('#table_additem tbody tr'), function () {
                var Item_Number = emptyStr($(this).find('td:eq(0) .itemnumber').val()) ? "" : $(this).find('td:eq(0) .itemnumber').val();
                var Item_Description = emptyStr($(this).find('td:eq(0) .itemdesc').text()) ? "" : $(this).find('td:eq(0) .itemdesc').text().trim();
                var Qty_Stock = emptyStr($(this).find('td.instock').text()) ? 0 : $(this).find('td.instock').text().trim();
                var Qty_Add_Stock = emptyStr($(this).find('td.addstock input').val()) ? 0 : $(this).find('td.addstock input').val();
                var Qty_Remove_Stock = emptyStr($(this).find('td.removestock input').val()) ? 0 : $(this).find('td.removestock input').val();
                var Item_Cost = emptyStr($(this).find('td.itemcost').text()) ? formatCurrency(0) : $(this).find('td.itemcost').text().trim();
                var Qty_After_Stock = emptyStr($(this).find('td.stockafter').text()) ? 0 : $(this).find('td.stockafter').text().trim();
                var Expected_Stock = emptyStr($(this).find('td.expstock').text()) ? 0 : $(this).find('td.expstock').text().trim();
                var Counted_Stock = emptyStr($(this).find('td.countstock input').val()) ? 0 : $(this).find('td.countstock').val();
                if (Qty_Add_Stock > 0 || Qty_Remove_Stock > 0 || Counted_Stock > 0) {
                    Total_Line_Item = Total_Line_Item + 1;
                    items.push({
                        'DOCDATE': DOCDATE,
                        'Reason': Reason,
                        'Lineitmseq': parseInt(Lineitmseq) + 10,
                        'Item_Number': Item_Number,
                        'Item_Description': Item_Description,
                        'Qty_Stock': Qty_Stock,
                        'Qty_Add_Stock': Qty_Add_Stock,
                        'Qty_Remove_Stock': Qty_Remove_Stock,
                        'Item_Cost': delFormatCurrency(Item_Cost),
                        'Qty_After_Stock': Qty_After_Stock,
                        'Expected_Stock': Expected_Stock,
                        'Counted_Stock': Counted_Stock
                    });
                }
            });

            //#endregion

            var model = {
                'DOCNUMBER': DOCNUMBER,
                'DOCDATE': DOCDATE,
                'Site_ID': Site_ID,
                'Site_Name': Site_Name,
                'Reason': Reason,
                'Total_Line_Item': Total_Line_Item,
                'Notes': Notes,
                'SADetails': items
        }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Inventory/StockAdjustment/SaveAdj',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        Clear();
                        swal({ type: "success", title: "Success", text: "Adjusted successfully" });
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

    function GetDataItemsHeader() {
        try {
            var DOCNUMBER = emptyStr($('.editStockAdj').find('#DOCNUMBER').val()) ? "" : $('.editStockAdj').find('#DOCNUMBER').val()
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/StockAdjustment/AdjGetDataHeader",
                type: "POST",
                //async: false,
                dataType: "json",
                data: {
                    model: model
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                    GetDataItemsDetail();
                },
                success: function (data) {
                    if (data.success) {
                        $.each(data.data, function (index, values) {
                            var DOCNUMBER = emptyStr(values.DOCNUMBER) ? "" : values.DOCNUMBER,
                                DOCDATE = moment(values.DOCDATE).format($("#dafor").val()),
                                Site_ID = emptyStr(values.Site_ID) ? "" : values.Site_ID,
                                Site_Name = emptyStr(values.Site_Name) ? "" : values.Site_Name,
                                Reason = emptyStr(values.Reason) ? "" : values.Reason,
                                Total_Line_Item = emptyStr(values.Total_Line_Item) ? 0 : values.Total_Line_Item,
                                Notes = emptyStr(values.Notes) ? "" : values.Notes,
                                Created_User = emptyStr(values.Created_User) ? "" : values.Created_User,
                                Modified_User = emptyStr(values.Modified_User) ? Created_User : values.Modified_User;

                            $('.editStockAdj').find('#DOCNUMBER').html(DOCNUMBER);
                            $('.editStockAdj').find('#SA_DATEITEM').html(DOCDATE);
                            $('.editStockAdj').find('#SA_REASON_TXT').html(Reason);
                            $('.editStockAdj').find('#SA_ADJUSTBY').html(Modified_User);
                            var htmlSite = '<tr><td>' + Site_ID + '</td></tr>' +
                                '<tr><td>' + Site_Name + '</td></tr>';
                            $('.editStockAdj').find('#table_site tbody').append(htmlSite);
                        });
                    } else {
                        swal("Error", "Error : " + data.message, "error");
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
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function GetDataItemsDetail() {
        try {
            var DOCNUMBER = emptyStr($('.editStockAdj').find('#DOCNUMBER').val()) ? "" : $('.editStockAdj').find('#DOCNUMBER').val()
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            var reason = emptyStr($('.editStockAdj').find('#SA_REASON_TXT').html()) ? "" : $('.editStockAdj').find('#SA_REASON_TXT').html();
            var widthItem = "60%";
            var visibleTD2 = true;
            if (reason.toLowerCase() == "receive items") {
                widthItem = "80%";
                visibleTD2 = false;
            }

            $('#table_SAItemsDetail tbody').empty();
            $('#table_SAItemsDetail').DataTable().destroy();

            dtTable = $('#table_SAItemsDetail').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/StockAdjustment/AdjGetDataDetail',
                    "datatype": "json",
                    //async: false,
                    data: { 'model': model },
                    beforeSend: function () {
                        $("#loading").show();
                    },
                    complete: function () {
                        $("#loading").hide();
                    },
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
                        data: 'Item_Number',
                        width: widthItem,
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'Qty_Stock',
                        className: 'text-right vertical-middle',
                        render: function (data, type, row) {
                            var Qty_Add_Stock = emptyStr(row.Qty_Add_Stock) ? 0 : row.Qty_Add_Stock;
                            var Qty_Remove_Stock = emptyStr(row.Qty_Remove_Stock) ? 0 : row.Qty_Remove_Stock;
                            var Counted_Stock = emptyStr(row.Counted_Stock) ? 0 : row.Counted_Stock;
                            var stock = emptyStr(data) ? 0 : data;
                            var reason = emptyStr(row.Reason) ? "" : row.Reason.trim();
                            $('#table_SAItemsDetail thead').find('th:eq(1)').html("Remove stock");
                            if (reason.toLowerCase() == "receive items") {
                                stock = Qty_Add_Stock;
                                $('#table_SAItemsDetail thead').find('th:eq(1)').html("Add stock");
                            } else if (reason.toLowerCase() == "inventory count") {
                                stock = Counted_Stock
                                $('#table_SAItemsDetail thead').find('th:eq(1)').html("Counted stock");
                            } else if (reason.toLowerCase() == "damage" || reason.toLowerCase() == "loss") {
                                stock = Qty_Remove_Stock;
                                $('#table_SAItemsDetail thead').find('th:eq(1)').html("Remove stock");
                            }
                            return stock;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'text-right vertical-middle',
                        "visible": visibleTD2,
                        render: function (data, type, row) {
                            var values = 0;
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = dtVal;
                            }
                            return formatCurrency(values);
                        }
                    },
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_SAItemsDetail').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    $.fn.dataTable.moment = function (format, locale) {
        var types = $.fn.dataTable.ext.type;

        // Add type detection
        types.detect.unshift(function (d) {
            return moment(d, format, locale, true).isValid() ?
                'moment-' + format :
                null;
        });

        // Add sorting method - use an integer for the sorting
        types.order['moment-' + format + '-pre'] = function (d) {
            return moment(d, format, locale, true).unix();
        };
    };

    $.fn.dataTable.moment($("#dafor").val());

    $('input').on('focusin', function () {
        $(this).prop("autocomplete", "off");
    });

    $('input').on('focus', function () {
        $(this).parent('.form-group').addClass('focused');
    });

    $('input').on('blur', function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parent('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

    $("#reason").select2({
        dropdownParent: $("#reason").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/GetReason',
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
                            var nilai = obj.REASON.trim();
                            var textnilai = obj.REASON.trim();
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

    $("#store").select2({
        dropdownParent: $("#store").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/GetDataStores',
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

    $("#site").select2({
        dropdownParent: $("#site").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/GetDataSites',
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
                            var nilai = obj.Site_ID.trim();
                            var textnilai = obj.Site_Name.trim();
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

    $("#SA_REASON").select2({
        dropdownParent: $("#SA_REASON").parent(),
        placeholder: "Select Reason",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/GetReason',
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
                            var nilai = obj.REASON.trim();
                            var textnilai = obj.REASON.trim();
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

    $("#SA_SITE").select2({
        dropdownParent: $("#SA_SITE").parent(),
        placeholder: "Select site",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/GetDataSites',
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
                            var nilai = obj.Site_ID.trim();
                            var textnilai = obj.Site_Name.trim();
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

    $("#SA_NOTES").on("keyup", function () {
        try {
            var sumNotes = $(this).val().length;
            $('.addStockAdj').find("#sumNotes").text(sumNotes + " / 500");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddStockAdj').on("click", function () {
        try {
            $('.listStockAdj').hide();
            $('.editStockAdj').hide();
            $('.addStockAdj').show();
            ClearNew();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_stockadjustment tbody').on("dblclick", 'tr', function () {
        try {
            $('.listStockAdj').hide();
            $('.addStockAdj').hide();
            $('.editStockAdj').show();
            ClearEdit();
            var currow = $(this).closest('tr');
            var DOCNUMBER = currow.find('td:eq(0)').text().trim();
            $('.editStockAdj').find('#DOCNUMBER').val(DOCNUMBER);
            GetDataItemsHeader();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSearch').on("change", function () {
        try {
            GetData();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#SA_REASON').on("change", function () {
        try {
            var reason = emptyStr($('#SA_REASON').val()) ? "" : $('#SA_REASON').val();
            $('#table_additem thead').find('th:eq(1)').html("In stock");
            if (reason.toLowerCase() == "receive items") {
                ItemsReceive();
                $('#table_additem thead').find('th:eq(2)').html("Add stock");
            } else if (reason.toLowerCase() == "inventory count") {
                ItemsInvCount();
                $('#table_additem thead').find('th:eq(1)').html("Expected stock");
                $('#table_additem thead').find('th:eq(2)').html("Counted stock");
            } else if (reason.toLowerCase() == "damage") {
                ItemsDamage();
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else if (reason.toLowerCase() == "loss") {
                ItemsLoss();
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else {
                AllItems();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on("focusin", "input[name=number]", function (e) {
        try {
            $(this).prop("autocomplete", "off");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on("keyup", "input[name=number]", function (e) {
        try {
            var currow = $(this).closest('tr');
            var InStock = emptyStr(currow.find('td:eq(1)').text()) ? 0 : currow.find('td:eq(1)').text();
            var addStock = $(this).val();
            var stockAfter = parseFloat(InStock) - parseFloat(addStock);
            var reason = emptyStr($('#SA_REASON').val()) ? "" : $('#SA_REASON').val();
            if (reason.toLowerCase() == "receive items") {
                stockAfter = parseFloat(InStock) + parseFloat(addStock);
            }
            currow.find('td.stockafter').text(stockAfter);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on("keydown", "input[name=number]", function (e) {
        try {
            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
            var charStr = String.fromCharCode(charCode);
            if (!validCodes.includes(charCode)) {
                if (!charStr.match(/^[0-9]+$/)) {
                    e.preventDefault();
                }
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#table_additem tbody").on("paste", "input[name=number]", function (e) {
        try {
            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
            var charStr = String.fromCharCode(charCode);
            if (!validCodes.includes(charCode)) {
                if (!charStr.match(/^[0-9]+$/)) {
                    e.preventDefault();
                }
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnBack').on("click", function () {
        try {
            Clear();
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

    $('.addStockAdj').on('click', '#btnAdjust', function () {
        try {
            //e.preventDefault();
            var IsValid = true;
            var Site_ID = emptyStr($('.addStockAdj').find('#SA_SITE').val()) ? "" : $('.addStockAdj').find('#SA_SITE').val(),
                Reason = emptyStr($('.addStockAdj').find('#SA_REASON').val()) ? "" : $('.addStockAdj').find('#SA_REASON').val(),
                Total_Line_Item = 0;
            $.each($('#table_additem tbody tr'), function () {
                var Qty_Add_Stock = emptyStr($(this).find('td.addstock input').val()) ? 0 : $(this).find('td.addstock input').val();
                var Qty_Remove_Stock = emptyStr($(this).find('td.removestock input').val()) ? 0 : $(this).find('td.removestock input').val();
                var Counted_Stock = emptyStr($(this).find('td.countstock input').val()) ? 0 : $(this).find('td.countstock').val();
                if (Qty_Add_Stock > 0 || Qty_Remove_Stock > 0 || Counted_Stock > 0) {
                    Total_Line_Item = Total_Line_Item + 1;
                }
            });
            if (Total_Line_Item == 0) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill items" });
            }
            if (emptyStr(Site_ID)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose site" });
            }
            if (emptyStr(Reason)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose reason" });
            }

            if (IsValid) {
                swal({
                    html: true,
                    title: 'Are you sure want to adjust the items?',
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
                            SaveAdj();
                        }
                    });
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});