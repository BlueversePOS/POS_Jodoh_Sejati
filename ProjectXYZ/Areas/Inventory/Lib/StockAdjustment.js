$(document).ready(function () {

    const dtValues = [
        { INV_STOCKADJITEM: "SA1001", INV_DATE: "2023-09-19 00:00:00", INV_REASON: "Receive items", INV_STORE: "JS STORE", INV_SITE: "GD001", QUANTITY: 2 }
    ];

    var arrItems = [];
    var dtItems = [];

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
        $('.addStockAdj').find("select option:selected").val("").text("");
        $('.addStockAdj').find("select").html("");
        $('.addStockAdj').find("select").val("");
        $('.addStockAdj').find('#SA_REASON').val("");
        $('.addStockAdj').find('#SA_SITE').val("");
        $('.addStockAdj').find('#SA_NOTES').val("");
        $('.addStockAdj').find("#sumNotes").text("0 / 500");
        arrItems.length = 0;
        AllItems();
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
        arrItems.length = 0;
    }

    function AllItems() {
        try {
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: arrItems,
                columns: [
                    {
                        data: 'Item_Number',
                        width: "100%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="LineItem_Option" value="' + LineItem_Option + '" />' +
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
                dom: "<'row'<'col-12'>>" +
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

    function AddItems(search) {
        try {
            var Item_Number = emptyStr($('#SearchItem').val()) ? "#" : $('#SearchItem').val();
            var Site_ID = emptyStr($('.addStockAdj').find('#SA_SITE').val()) ? "" : $('.addStockAdj').find('#SA_SITE').val();
            var LineItem_Option = 0;
            if (Item_Number != "#") {
                var splitVal = Item_Number.split("|");
                Item_Number = emptyStr(splitVal[0]) ? "#" : splitVal[0];
                LineItem_Option = emptyStr(splitVal[1]) ? 0 : splitVal[1];
            }
            var model = {
                Item_Number: Item_Number,
                LineItem_Option: LineItem_Option,
                Site_ID: Site_ID
            }
            $.ajax({
                url: rootUrl + "Inventory/StockAdjustment/AdjGetDataItems",
                type: "POST",
                async: false,
                dataType: "json",
                data: {
                    model: model
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (data) {
                    if (data.success) {
                        $.each(data.data, function (index, values) {
                            var Item_Number = emptyStr(values.Item_Number) ? "" : values.Item_Number.trim(),
                                LineItem_Option = emptyStr(values.LineItem_Option) ? 0 : values.LineItem_Option,
                                Item_Description = emptyStr(values.Item_Description) ? "" : values.Item_Description.trim(),
                                Item_SKU = emptyStr(values.Item_SKU) ? "" : values.Item_SKU.trim(),
                                InStock = emptyStr(values.InStock) ? 0 : values.InStock,
                                Item_Cost = emptyStr(values.Item_Cost) ? 0 : values.Item_Cost;

                            var exists = false;
                            if (arrItems.length > 0) {
                                $.map(arrItems, function (x) {
                                    var Item_Numberlist = emptyStr(x.Item_Number) ? "" : x.Item_Number.trim();
                                    var LineItem_Optionlist = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option;
                                    if (Item_Number == Item_Numberlist && LineItem_Option == LineItem_Optionlist) {
                                        exists = true;
                                        x.InStock = InStock;
                                        x.Item_Cost = Item_Cost;
                                        if (search) {
                                            swal({ type: "info", title: "Information", text: "Cannot input with the same item" });
                                        }
                                    }
                                });
                            }
                            if (!exists) {
                                arrItems.push({
                                    'Item_Number': Item_Number,
                                    'LineItem_Option': LineItem_Option,
                                    'Item_Description': Item_Description,
                                    'Item_SKU': Item_SKU,
                                    'InStock': InStock,
                                    'Item_Cost': Item_Cost
                                });
                            }
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
    }

    function ItemsReceive() {
        try {
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: arrItems,
                columns: [
                    {
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="LineItem_Option" value="' + LineItem_Option + '" />' +
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
                dom: "<'row'<'col-12'>>" +
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
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: arrItems,
                columns: [
                    {
                        data: 'Item_Number',
                        width: "50%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="LineItem_Option" value="' + LineItem_Option + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'text-right vertical-middle expstock'
                    },
                    {
                        data: null,
                        orderable: false,
                        className: 'vertical-middle countstock',
                        render: function (data, type, row) {
                            var html = '<input type="text" name="number" class="form-input text-right" value="0" />';
                            return html;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        "visible": false,
                        className: 'text-right vertical-middle itemcost',
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
                        className: 'text-right vertical-middle stockafter'
                    },
                    {
                        data: "Item_Number",
                        width: "1px",
                        orderable: false,
                        className: 'vertical-middle text-center deleteitem',
                        render: function (data, type, row) {
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<i type="button" class="fa fa-trash-alt text-gray btndel" value="' + Item_Number + '"></i>';
                            return html;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
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
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: arrItems,
                columns: [
                    {
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="LineItem_Option" value="' + LineItem_Option + '" />' +
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
                dom: "<'row'<'col-12'>>" +
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
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTable = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: arrItems,
                columns: [
                    {
                        data: 'Item_Number',
                        width: "35%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="LineItem_Option" value="' + LineItem_Option + '" />' +
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
                dom: "<'row'<'col-12'>>" +
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
                var LineItem_Option = emptyStr($(this).find('td:eq(0) .LineItem_Option').val()) ? "" : $(this).find('td:eq(0) .LineItem_Option').val();
                var Item_Description = emptyStr($(this).find('td:eq(0) .itemdesc').text()) ? "" : $(this).find('td:eq(0) .itemdesc').text().trim();
                var Qty_Stock = emptyStr($(this).find('td.instock').text()) ? 0 : $(this).find('td.instock').text().trim();
                var Qty_Add_Stock = emptyStr($(this).find('td.addstock input').val()) ? 0 : $(this).find('td.addstock input').val();
                var Qty_Remove_Stock = emptyStr($(this).find('td.removestock input').val()) ? 0 : $(this).find('td.removestock input').val();
                var Item_Cost = emptyStr($(this).find('td.itemcost').text()) ? formatCurrency(0) : $(this).find('td.itemcost').text().trim();
                var Qty_After_Stock = emptyStr($(this).find('td.stockafter').text()) ? 0 : $(this).find('td.stockafter').text().trim();
                var Expected_Stock = emptyStr($(this).find('td.expstock').text()) ? 0 : $(this).find('td.expstock').text().trim();
                var Counted_Stock = emptyStr($(this).find('td.countstock input').val()) ? 0 : $(this).find('td.countstock input').val();
                if (Qty_Add_Stock > 0 || Qty_Remove_Stock > 0 || Counted_Stock > 0) {
                    Total_Line_Item = Total_Line_Item + 1;
                    Lineitmseq = parseInt(Lineitmseq) + 10;
                    items.push({
                        'DOCDATE': DOCDATE,
                        'Reason': Reason,
                        'Lineitmseq': Lineitmseq,
                        'Item_Number': Item_Number,
                        'LineItem_Option': LineItem_Option,
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
                        swal({ type: "success", title: "Success", html: true, text: "<span>Adjusted successfully with document number <b>" + result.message + "</b></span>" });
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
            var widthItem = "80%";
            var visibleTD2 = false;
            if (reason.toLowerCase() == "receive items") {
                widthItem = "60%";
                visibleTD2 = true;
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
                        orderable: false,
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
                        orderable: false,
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
                        orderable: false,
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

    function RestoreQty() {
        $.each($('#table_additem tbody tr'), function () {
            var currow = $(this);
            var itemnumber = emptyStr(currow.find('td:eq(0) input.itemnumber').val()) ? "" : currow.find('td:eq(0) input.itemnumber').val();
            var LineItem_Option = emptyStr(currow.find('td:eq(0) input.LineItem_Option').val()) ? 0 : currow.find('td:eq(0) input.LineItem_Option').val();
            $.each(dtItems, function (i, x) {
                var Item_Number2 = emptyStr(x.Item_Number) ? 0 : x.Item_Number.trim(),
                    LineItem_Option2 = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option,
                    removeStock = emptyStr(x.removeStock) ? 0 : x.removeStock,
                    addstock = emptyStr(x.addstock) ? 0 : x.addstock,
                    countstock = emptyStr(x.countstock) ? 0 : x.countstock,
                    stockAfter = emptyStr(x.stockAfter) ? 0 : x.stockAfter;
                if (itemnumber == Item_Number2 && LineItem_Option == LineItem_Option2) {
                    currow.find('td.removestock input').val(removeStock);
                    currow.find('td.addstock input').val(addstock);
                    currow.find('td.countstock input').val(countstock);
                    currow.find('td.stockafter').text(stockAfter);
                }
            });
        });
    }

    function BackupQty() {
        dtItems.length = 0;
        $.each($('#table_additem tbody tr'), function () {
            var currow = $(this);
            var itemnumber = emptyStr(currow.find('td:eq(0) input.itemnumber').val()) ? "" : currow.find('td:eq(0) input.itemnumber').val();
            var LineItem_Option = emptyStr(currow.find('td:eq(0) input.LineItem_Option').val()) ? 0 : currow.find('td:eq(0) input.LineItem_Option').val();
            var InStock = emptyStr(currow.find('td:eq(1)').text()) ? 0 : currow.find('td:eq(1)').text();
            var removeStock = emptyStr(currow.find('td.removestock input').val()) ? 0 : currow.find('td.removestock input').val();
            var addstock = emptyStr(currow.find('td.addstock input').val()) ? 0 : currow.find('td.addstock input').val();
            var countstock = emptyStr(currow.find('td.countstock input').val()) ? 0 : currow.find('td.countstock input').val();
            var stockAfter = emptyStr(currow.find('td.stockafter').text()) ? 0 : currow.find('td.stockafter').text();
            dtItems.push({
                'Item_Number': itemnumber,
                'LineItem_Option': LineItem_Option,
                'removeStock': removeStock,
                'addstock': addstock,
                'countstock': countstock,
                'stockAfter': stockAfter,
            });
        });
    }

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

    //#region Convert to PDF/CSV

    window.jsPDF = window.jspdf.jsPDF;
    var specialElementHandlers = {
        '#editTfItem': function (element, renderer) {
            return true;
        }
    };

    $('#saveasPDF').click(function () {
        try {
            $(".dataTables_length").prop("style", "display:none;");
            $(".dataTables_filter").hide();
            $(".dataTables_info").hide();
            $(".dataTables_paginate").hide();
            $('#pdfBody').prop("style", "letter-spacing: 0.05px;");
            let srcwidth = document.getElementById('pdfBody').scrollWidth;
            var pdf = new jsPDF('p', 'pt', 'a4');
            var currDate = moment(new Date()).format($('#dafor').val() + " hh:mm:ss");
            pdf.html(document.getElementById('pdfBody'), {
                html2canvas: {
                    scale: 600 / srcwidth
                    //600 is the width of a4 page. 'a4': [595.28, 841.89]
                },
                callback: function () {
                    pdf.save('Stock Adjustment ' + currDate + '.pdf');
                }
            });
            $(".dataTables_length").show();
            $(".dataTables_filter").show();
            $(".dataTables_info").show();
            $(".dataTables_paginate").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

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

    $("#SearchItem").select2({
        dropdownParent: $("#SearchItem").parent(),
        placeholder: "Search items",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/StockAdjustment/AdjSearchDataItems',
            type: 'POST',
            dataType: 'json',
            data: function (params) {
                var Site_ID = emptyStr($('.addStockAdj').find('#SA_SITE').val()) ? "" : $('.addStockAdj').find('#SA_SITE').val();
                var model = {
                    Item_Number: "",
                    LineItem_Option: 0,
                    Site_ID: Site_ID
                }
                return {
                    model: model,
                    Prefix: params.term
                }
            },
            processResults: function (data) {
                return {
                    results: $.map(data.data,
                        function (obj) {
                            var nilai = obj.Item_Number.trim() + "|" + obj.LineItem_Option;
                            var textnilai = obj.Item_Description.trim();
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
            var currow = $(this).closest('tr');
            var DOCNUMBER = currow.find('td:eq(0)').text().trim();
            var dtEmpty = currow.find('.dataTables_empty').is(':visible');
            if (!dtEmpty) {
                $('.listStockAdj').hide();
                $('.addStockAdj').hide();
                $('.editStockAdj').show();
                ClearEdit();
                $('.editStockAdj').find('#DOCNUMBER').val(DOCNUMBER);
                GetDataItemsHeader();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSearch').on("click", function () {
        try {
            GetData();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#SA_REASON, #SearchItem, #SA_SITE').on("change", function () {
        try {
            var reason = emptyStr($('#SA_REASON').val()) ? "" : $('#SA_REASON').val();
            var id = emptyStr($(this).attr("id")) ? "" : $(this).attr("id");
            var search = false;
            if (id.toLowerCase() == "searchitem") {
                search = true;
            }

            if (!search && arrItems.length > 0) {
                $.each(arrItems, function (i, x) {
                    var Item_Number = emptyStr(x.Item_Number) ? "" : x.Item_Number.trim();
                    var LineItem_Option = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option;
                    var Item_Description = emptyStr(x.Item_Description) ? "" : x.Item_Description.trim();
                    var newOption = $("<option selected='selected'></option>").val(Item_Number + "|" + LineItem_Option).text(Item_Description);
                    $('#SearchItem').append(newOption);
                    AddItems(search);
                });
            } else if (search) {
                AddItems(search);
            }
            BackupQty();
            if (reason.toLowerCase() == "receive items") {
                ItemsReceive();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Add stock");
            } else if (reason.toLowerCase() == "inventory count") {
                ItemsInvCount();
                $('#table_additem thead').find('th:eq(1)').html("Expected stock");
                $('#table_additem thead').find('th:eq(2)').html("Counted stock");
            } else if (reason.toLowerCase() == "damage") {
                ItemsDamage();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else if (reason.toLowerCase() == "loss") {
                ItemsLoss();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else {
                AllItems();
            }
            $('.addStockAdj').find("#SearchItem option:selected").val("").text("");
            $('.addStockAdj').find("#SearchItem").html("");
            $('.addStockAdj').find("#SearchItem").val("");
            RestoreQty();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on('click', '.deleteitem .btndel', function () {
        try {
            var currow = $(this).closest('tr');
            var Item_Number = emptyStr(currow.find('td:eq(0) .itemnumber').val()) ? "" : currow.find('td:eq(0) .itemnumber').val();
            var LineItem_Option = emptyStr(currow.find('td:eq(0) .LineItem_Option').val()) ? "" : currow.find('td:eq(0) .LineItem_Option').val();
            arrItems = $.grep(arrItems, function (x) {
                if (Item_Number == x.Item_Number && LineItem_Option == x.LineItem_Option) {
                    return false;
                } else {
                    return true;
                }
            });
            var reason = emptyStr($('#SA_REASON').val()) ? "" : $('#SA_REASON').val();
            AddItems(false);
            BackupQty();
            if (reason.toLowerCase() == "receive items") {
                ItemsReceive();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Add stock");
            } else if (reason.toLowerCase() == "inventory count") {
                ItemsInvCount();
                $('#table_additem thead').find('th:eq(1)').html("Expected stock");
                $('#table_additem thead').find('th:eq(2)').html("Counted stock");
            } else if (reason.toLowerCase() == "damage") {
                ItemsDamage();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else if (reason.toLowerCase() == "loss") {
                ItemsLoss();
                $('#table_additem thead').find('th:eq(1)').html("In stock");
                $('#table_additem thead').find('th:eq(2)').html("Remove stock");
            } else {
                AllItems();
            }
            RestoreQty();
        } catch (err) {
            $(this).val(0);
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
            var addStock = emptyStr($(this).val()) ? 0 : $(this).val();
            var stockAfter = parseFloat(InStock) - parseFloat(addStock);
            var reason = emptyStr($('#SA_REASON').val()) ? "" : $('#SA_REASON').val();
            if (reason.toLowerCase() == "receive items") {
                stockAfter = parseFloat(InStock) + parseFloat(addStock);
            }
            if ((reason.toLowerCase() == "damage" || reason.toLowerCase() == "loss") && (parseFloat(addStock) > parseFloat(InStock) || parseFloat(stockAfter) < 0)) {
                swal({ type: "info", title: "Information", text: "Cannot greater than quantity in stock" });
                $(this).val(0);
                stockAfter = InStock;
                currow.find('td.stockafter').text(stockAfter);
                return false;
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
                var Counted_Stock = emptyStr($(this).find('td.countstock input').val()) ? 0 : $(this).find('td.countstock input').val();
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