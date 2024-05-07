$(document).ready(function () {

    const dtValues = [
        { INV_COUNTITEM: "IC1001", INV_DATE: "2023-09-19 00:00:00", INV_DATECOMPLETED: "1900-01-01 00:00:00", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_STATUS: 1 /*1 progress 2 pending 3 completed */, INV_NOTES: "Testt" }
    ];
    var arrItems = [];

    const sStatus = [
        { id: 1, text: "Save" },
        { id: 2, text: "In progress" },
        { id: 3, text: "Completed" }
    ]

    $(".main-header").find(".title").html("Inventory Counts");

    var validCodes = [8, 9, 13, 46, 37, 39, 46, 18, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];

    Clear();

    function Clear() {
        $("#status").select2({
            dropdownParent: $("#status").parent(),
            placeholder: "All",
            multiple: false,
            allowClear: true,
            width: "100%",
            data: sStatus
        });
        $('.listInvCount').find("select").val(null).trigger("change");
        $('.listInvCount').show();
        $('.addInvCount').hide();
        $('.editInvCount').hide();
        $('.countInvCount').hide();
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
            var Status = emptyStr($('.listInvCount').find('#status').val()) ? "" : $('.listInvCount').find('#status').val(),
                Site_ID = emptyStr($('.listInvCount').find('#site').val()) ? "" : $('.listInvCount').find('#site').val();
            var model = {
                DOCNUMBER: "",
                Status: Status,
                Site_ID: Site_ID
            }

            $('#table_invcount tbody').empty();
            $('#table_invcount').DataTable().destroy();

            dtTable = $('#table_invcount').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/InvCounts/ICGetDataList',
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
                        data: 'Created_Date',
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
                    {
                        data: 'Completed_Date',
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
                    /*{ data: 'INV_STORE' },*/
                    {
                        data: 'Site_Name',
                        render: function (data, type, row) {
                            var Site = emptyStr(data) ? "" : data.trim();
                            return Site;
                        }
                    },
                    { data: 'Status_Txt' },
                    { data: 'Notes' }
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
            $('#table_invcount').attr('style', 'width: 100%');

            $('#table_invcount_filter').on('change', 'input', function () {
                try {
                    dtTable.search($(this).val()).draw();
                } catch (err) {
                    swal({ type: "error", title: "Error", text: err.message });
                }
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearNew() {
        var newOption = $("<option selected='selected'></option>").val("").text("");
        $('.addInvCount').find('#SearchItem').append(newOption);
        newOption = $("<option selected='selected'></option>").val("").text("");
        $("#SearchItem").prop("disabled", false);
        $('.addInvCount').find('#IC_SITE').append(newOption);
        $('.addInvCount').find('#DOCNUMBER').val("");
        $('.addInvCount').find('#IC_NOTES').val("");
        $('.addInvCount').find('input.ictype').prop("checked", false);
        $('.addInvCount').find('input#IC_TYPE_PARTIAL').prop("checked", true);
        $('.addInvCount').find('#table_additem tbody tr').empty();
        $('.addInvCount').find('#table_additem tbody tr').remove();
        $('.addInvCount').find("#sumNotes").text("0 / 500");
        arrItems.length = 0;
    }

    function ClearEdit() {
        $('.editInvCount').find('#DOCNUMBER').html("");
        $('.editInvCount').find('#IC_STATUS_ITEM').html("");
        $('.editInvCount').find('#IC_DATEITEM').html("");
        $('.editInvCount').find('#IC_CREATEDBY').html("");
        $('.editInvCount').find('#table_site tbody tr').empty();
        $('.editInvCount').find('#table_site tbody tr').remove();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').empty();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').remove();
    }

    function AddItems(search) {
        try {
            var Item_Number = emptyStr($('#SearchItem').val()) ? "#" : $('#SearchItem').val();
            var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val();
            var LineItem_Option = 0;
            if (Item_Number != "#") {
                var splitVal = Item_Number.split("|");
                Item_Number = emptyStr(splitVal[0]) ? "#" : splitVal[0];
                LineItem_Option = emptyStr(splitVal[1]) ? 0 : splitVal[1];
            }
            if (emptyStr(Site_ID) && arrItems.length > 0) {
                $.map(arrItems, function (x) {
                    x.InStock = 0;
                });
            }
            var model = {
                Item_Number: Item_Number,
                LineItem_Option: LineItem_Option,
                Site_ID: Site_ID
            }
            $.ajax({
                url: rootUrl + "Inventory/InvCounts/ICGetDataItems",
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

    function AddItemsByCat(Category) {
        try {
            var Item_Number = "";
            var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val();
            var LineItem_Option = 0;
            arrItems.length = 0;
            var model = {
                Item_Number: Item_Number,
                LineItem_Option: LineItem_Option,
                Site_ID: Site_ID,
                Category_ID: Category
            }
            $.ajax({
                url: rootUrl + "Inventory/InvCounts/ICGetDataItems",
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
                    ItemsInvCount();
                    if (arrItems.length > 0) {
                        $("#SearchItem").prop("disabled", true);
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

    function ItemsInvCount() {
        try {
            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTableItems = $('#table_additem').DataTable({
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
                                '<input type="hidden" class="itemSKUvalue" value="' + Item_SKU + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100 itemSKU">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'text-right vertical-middle expstock'
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
                    "<'row'<'col-12'p>>",
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

    function CategoryList() {
        try {
            $('#table_lookup tbody').empty();
            $('#table_lookup').DataTable().destroy();

            dtTableCat = $('#table_lookup').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
                responsive: true,
                searchable: true,
                autoWidth: false,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'Inventory/InvCounts/ICGetCategory',
                    "datatype": "json",
                    //async: false,
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
                        data: 'Category_ID',
                        width: "1%",
                        className: 'text-center vertical-middle',
                        orderable: false,
                        render: function (data, type, row) {
                            var Category_ID = emptyStr(data) ? "" : data.trim();
                            var html = '<input type="checkbox" class="chk" value="' + Category_ID + '" />';
                            return html;
                        }
                    },
                    {
                        data: 'Category_Name',
                        className: 'vertical-middle'
                    }
                ],
                order: [],
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
            $('#table_lookup').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function SaveCounts(Status) {
        try {
            var DOCNUMBER = emptyStr($('.addInvCount').find('#DOCNUMBER').val()) ? "" : $('.addInvCount').find('#DOCNUMBER').val(),
                Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val(),
                Site_Name = emptyStr($('.addInvCount').find('#IC_SITE :selected').text()) ? "" : $('.addInvCount').find('#IC_SITE :selected').text(),
                Notes = emptyStr($('.addInvCount').find("#IC_NOTES").val()) ? "" : $('.addInvCount').find("#IC_NOTES").val(),
                Type_Inventory_Count = emptyStr($('.addInvCount').find(".ictype:checked").val()) ? 0 : $('.addInvCount').find(".ictype:checked").val();
            Status = emptyStr(Status) ? 0 : Status;

            //#region Items

            var items = [];
            var Lineitmseq = 0;
            $.each($('#table_additem tbody tr'), function () {
                var Item_Number = emptyStr($(this).find('td:eq(0) .itemnumber').val()) ? "" : $(this).find('td:eq(0) .itemnumber').val();
                var Item_Description = emptyStr($(this).find('td:eq(0) .itemdesc').text()) ? "" : $(this).find('td:eq(0) .itemdesc').text().trim();
                var LineItem_Option = emptyStr($(this).find('td:eq(0) .LineItem_Option').val()) ? "" : $(this).find('td:eq(0) .LineItem_Option').val();
                var Item_SKU = emptyStr($(this).find('td:eq(0) .itemSKUvalue').val()) ? "" : $(this).find('td:eq(0) .itemSKUvalue').val();
                var Expected_Stock = emptyStr($(this).find('td.expstock').text()) ? 0 : $(this).find('td.expstock').text().trim();

                if (!emptyStr(Item_Number)) {
                    Lineitmseq = Lineitmseq + 10;
                    items.push({
                        'Lineitmseq': Lineitmseq,
                        'Item_Number': Item_Number,
                        'Item_Description': Item_Description,
                        'Item_SKU': Item_SKU,
                        'Expected_Stock': Expected_Stock,
                        'Counted_Stock': 0,
                        'Different_Stock': 0,
                        'Item_Cost': 0,
                        'Item_Cost_Different': 0
                    });
                }
            });

            //#endregion

            var model = {
                'DOCNUMBER': DOCNUMBER,
                'Site_ID': Site_ID,
                'Site_Name': Site_Name,
                'Type_Inventory_Count': Type_Inventory_Count,
                'Notes': Notes,
                'Status': Status,
                'InvCount': 0,
                'ICDetails': items
            }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Inventory/InvCounts/ICSaveCount',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        swal({ type: "success", title: "Success", html: true, text: "<span>Count(s) item saved successfully with document number <b>" + result.message + "</b></span>" });
                        if (Status == 1) {
                            Clear();
                        } else if (Status == 2) {
                            $('.listInvCount').hide();
                            $('.addInvCount').hide();
                            $('.editInvCount').hide();
                            $('.countInvCount').show();
                            $('.countInvCount').find('#DOCNUMBER').val(result.message);
                            GetDataICCount();
                        }
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

    function SaveComplete(Status) {
        try {
            var DOCNUMBER = emptyStr($('.countInvCount').find('#DOCNUMBER').val()) ? "" : $('.countInvCount').find('#DOCNUMBER').val(),
                Status = emptyStr(Status) ? 0 : Status;

            //#region Items

            var items = [];
            var Lineitmseq = 0;
            dtTableCount.rows().nodes().to$().each(function () {
                var Item_Number = emptyStr($(this).find('td:eq(0) .itemnumber').val()) ? "" : $(this).find('td:eq(0) .itemnumber').val();
                var Item_Description = emptyStr($(this).find('td:eq(0) .itemdesc').text()) ? "" : $(this).find('td:eq(0) .itemdesc').text().trim();
                var LineItem_Option = emptyStr($(this).find('td:eq(0) .LineItem_Option').val()) ? "" : $(this).find('td:eq(0) .LineItem_Option').val();
                var Item_SKU = emptyStr($(this).find('td:eq(0) .itemSKUvalue').val()) ? "" : $(this).find('td:eq(0) .itemSKUvalue').val();
                var Expected_Stock = emptyStr($(this).find('td.expstock').text()) ? 0 : $(this).find('td.expstock').text().trim();
                var countstock = emptyStr($(this).find('td.countstock input#Count_Stock').val()) ? 0 : $(this).find('td.countstock input#Count_Stock').val();
                var Item_Cost = emptyStr($(this).find('td.countstock input#Item_Cost').val()) ? 0 : $(this).find('td.countstock input#Item_Cost').val();
                var Different_Stock = emptyStr($(this).find('td.diffstock').text()) ? 0 : $(this).find('td.diffstock').text().trim();
                var Item_Cost_Different = emptyStr($(this).find('td.diffcost').text()) ? formatCurrency(0) : $(this).find('td.diffcost').text().trim();

                if (!emptyStr(Item_Number)) {
                    Lineitmseq = Lineitmseq + 10;
                    items.push({
                        'Lineitmseq': Lineitmseq,
                        'Item_Number': Item_Number,
                        'Item_Description': Item_Description,
                        'Item_SKU': Item_SKU,
                        'Expected_Stock': Expected_Stock,
                        'Counted_Stock': countstock,
                        'Different_Stock': Different_Stock,
                        'Item_Cost': Item_Cost,
                        'Item_Cost_Different': delFormatCurrency(Item_Cost_Different)
                    });
                }
            });

            //#endregion

            var model = {
                'DOCNUMBER': DOCNUMBER,
                'Status': Status,
                'InvCount': 1,
                'ICDetails': items
            }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Inventory/InvCounts/ICSaveCount',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        swal({ type: "success", title: "Success", html: true, text: "<span>Count(s) item saved successfully with document number <b>" + result.message + "</b></span>" });
                        Clear();
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

    function GetDataICHeaderEdit() {
        try {
            var DOCNUMBER = emptyStr($('.addInvCount').find('#DOCNUMBER').val()) ? "" : $('.addInvCount').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/InvCounts/ICGetDataList",
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
                },
                success: function (data) {
                    if (data.success) {
                        $.each(data.data, function (index, values) {
                            var DOCNUMBER = emptyStr(values.DOCNUMBER) ? "" : values.DOCNUMBER.trim(),
                                DOCDATE = moment(values.DOCDATE).format("YYYY") <= 2000 ? "" : moment(values.DOCDATE).format($('#dafor').val()),
                                Completed_Date = moment(values.Completed_Date).format("YYYY") <= 2000 ? "" : moment(values.Completed_Date).format($('#dafor').val()),
                                Site_ID = emptyStr(values.Site_ID) ? "" : values.Site_ID.trim(),
                                Site_Name = emptyStr(values.Site_Name) ? "" : values.Site_Name.trim(),
                                Type_Inventory_Count = emptyStr(values.Type_Inventory_Count) ? 0 : values.Type_Inventory_Count,
                                Total_Line_Item = emptyStr(values.Total_Line_Item) ? 0 : values.Total_Line_Item,
                                Notes = emptyStr(values.Notes) ? "" : values.Notes.trim(),
                                Status = emptyStr(values.Status) ? 0 : values.Status,
                                Status_Txt = emptyStr(values.Status_Txt) ? "" : values.Status_Txt.trim(),
                                Created_User = emptyStr(values.Created_User) ? "" : values.Created_User.trim(),
                                Created_Date = moment(values.Created_Date).format("YYYY") <= 2000 ? "" : moment(values.Created_Date).format($('#dafor').val()),
                                Created_time = moment(values.Created_time).format("h:mm a"),
                                Modified_User = emptyStr(values.Modified_User) ? "" : values.Modified_User.trim(),
                                Modified_Date = moment(values.Modified_Date).format("YYYY") <= 2000 ? "" : moment(values.Modified_Date).format($('#dafor').val()),
                                Modified_time = moment(values.Modified_time).format("h:mm a");

                            var newOption = $("<option selected='selected'></option>").val(Site_ID).text(Site_Name);
                            $('.addInvCount').find('#IC_SITE').append(newOption);
                            $('.addInvCount').find('#IC_NOTES').val(Notes).parent('.form-group').addClass('focused');
                            $('.addInvCount').find("#sumNotes").text(Notes.length + " / 500");
                            $('.addInvCount').find('input.ictype').prop("checked", false);
                            $('.addInvCount').find('input.ictype[value="' + Type_Inventory_Count + '"]').prop("checked", true);
                        });
                        ItemsInvCount();
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
            }).done(function () {
                GetDataICDetail();
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataICDetailEdit(Item_Number, LineItem_Option, Item_Description, Item_SKU, InStock, Item_Cost) {
        var exists = false;
        if (arrItems.length > 0) {
            $.map(arrItems, function (x) {
                var Item_Numberlist = emptyStr(x.Item_Number) ? "" : x.Item_Number.trim();
                var LineItem_Optionlist = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option;
                if (Item_Number == Item_Numberlist && LineItem_Option == LineItem_Optionlist) {
                    exists = true;
                    x.InStock = InStock;
                    x.Item_Cost = Item_Cost;
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
    }

    function GetDataICHeader() {
        try {
            var DOCNUMBER = emptyStr($('.editInvCount').find('#DOCNUMBER').val()) ? "" : $('.editInvCount').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/InvCounts/ICGetDataList",
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
                },
                success: function (data) {
                    if (data.success) {
                        $.each(data.data, function (index, values) {
                            var DOCNUMBER = emptyStr(values.DOCNUMBER) ? "" : values.DOCNUMBER.trim(),
                                DOCDATE = moment(values.DOCDATE).format("YYYY") <= 2000 ? "" : moment(values.DOCDATE).format($('#dafor').val()),
                                Completed_Date = moment(values.Completed_Date).format("YYYY") <= 2000 ? "" : moment(values.Completed_Date).format($('#dafor').val()),
                                Site_ID = emptyStr(values.Site_ID) ? "" : values.Site_ID.trim(),
                                Site_Name = emptyStr(values.Site_Name) ? "" : values.Site_Name.trim(),
                                Type_Inventory_Count = emptyStr(values.Type_Inventory_Count) ? 0 : values.Type_Inventory_Count,
                                Total_Line_Item = emptyStr(values.Total_Line_Item) ? 0 : values.Total_Line_Item,
                                Notes = emptyStr(values.Notes) ? "" : values.Notes.trim(),
                                Status = emptyStr(values.Status) ? 0 : values.Status,
                                Status_Txt = emptyStr(values.Status_Txt) ? "" : values.Status_Txt.trim(),
                                Created_User = emptyStr(values.Created_User) ? "" : values.Created_User.trim(),
                                Created_Date = moment(values.Created_Date).format("YYYY") <= 2000 ? "" : moment(values.Created_Date).format($('#dafor').val()),
                                Created_time = moment(values.Created_time).format("h:mm a"),
                                Modified_User = emptyStr(values.Modified_User) ? "" : values.Modified_User.trim(),
                                Modified_Date = moment(values.Modified_Date).format("YYYY") <= 2000 ? "" : moment(values.Modified_Date).format($('#dafor').val()),
                                Modified_time = moment(values.Modified_time).format("h:mm a");

                            $('.editInvCount').find('#DOCNUMBER').html(DOCNUMBER);
                            $('.editInvCount').find('#StatusDoc').val(Status);
                            $('.editInvCount').find('#IC_STATUS_ITEM').html(Status_Txt).removeClass("text-gray-dark");
                            $('.editInvCount').find('#IC_DATEITEM').html(Created_Date + " " + Created_time);
                            $('.editInvCount').find('#IC_CREATEDBY').html(Created_User);
                            var htmlSite = '<tr><td>' + Site_ID + '</td></tr>' +
                                '<tr><td>' + Site_Name + '</tr>';
                            $('.editInvCount').find('#table_site tbody').append(htmlSite);

                            $('.editInvCount').find('#saveasPDF').hide();
                            $('.editInvCount').find('#saveasCSV').hide();
                            $('.editInvCount').find('#btnCountStock').show();
                            $('.editInvCount').find('#btnEdit').show();
                            $('.editInvCount').find('.dropdown').show();
                            if (Status == 3) {
                                $('.editInvCount').find('#IC_STATUS_ITEM').addClass("text-gray-dark");
                                $('.editInvCount').find('#IC_STATUS_ITEM').html(Status_Txt + "(" + Completed_Date + " " + Modified_time + ")");
                                $('.editInvCount').find('#saveasPDF').show();
                                $('.editInvCount').find('#saveasCSV').show();
                                $('.editInvCount').find('#btnCountStock').hide();
                                $('.editInvCount').find('#btnEdit').hide();
                                $('.editInvCount').find('.dropdown').hide();
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
            }).done(function () {
                GetDataICDetail();
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataICDetail() {
        try {
            var DOCNUMBER = emptyStr($('.editInvCount').find('#DOCNUMBER').val()) ? "" : $('.editInvCount').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }

            $('#table_ICItemsDetail tbody').empty();
            $('#table_ICItemsDetail').DataTable().destroy();

            dtTableDetail = $('#table_ICItemsDetail').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/InvCounts/ICGetDataDetail',
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
                                '<input type="hidden" class="itemSKUvalue" value="' + Item_SKU + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100 itemSKU">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'Expected_Stock',
                        className: 'text-right vertical-middle expstock'
                    },
                    {
                        data: 'Counted_Stock',
                        className: 'text-right vertical-middle countstock',
                        render: function (data, type, row) {
                            var Status = emptyStr($('.editInvCount').find('#StatusDoc').val()) ? 0 : $('.editInvCount').find('#StatusDoc').val();
                            var Counted_Stock = emptyStr(data) ? 0 : data;
                            if (Status == 1) {
                                Counted_Stock = '-';
                            }
                            return Counted_Stock;
                        }
                    },
                    {
                        data: 'Different_Stock',
                        className: 'text-right vertical-middle diffstock',
                        render: function (data, type, row) {
                            var Status = emptyStr($('.editInvCount').find('#StatusDoc').val()) ? 0 : $('.editInvCount').find('#StatusDoc').val();
                            var Different_Stock = emptyStr(data) ? 0 : data;
                            if (Status == 1) {
                                Different_Stock = '-';
                            }
                            return Different_Stock;
                        }
                    },
                    {
                        data: 'Item_Cost_Different',
                        className: 'text-right vertical-middle diffcost',
                        render: function (data, type, row) {
                            var Status = emptyStr($('.editInvCount').find('#StatusDoc').val()) ? 0 : $('.editInvCount').find('#StatusDoc').val();
                            var Item_Cost_Different = emptyStr(data) ? 0 : data;
                            Item_Cost_Different = formatCurrency(Item_Cost_Different);
                            var Total_Different_Stock = emptyStr(row.Total_Different_Stock) ? 0 : row.Total_Different_Stock;
                            var Total_Item_Cost_Different = emptyStr(row.Total_Item_Cost_Different) ? 0 : row.Total_Item_Cost_Different;
                            $('#table_ICItemsDetail tfoot').find('td.difference').text(Total_Different_Stock);
                            $('#table_ICItemsDetail tfoot').find('td.costdifference').text(formatCurrency(Total_Item_Cost_Different));
                            if (Status == 1) {
                                Item_Cost_Different = '-';
                                $('#table_ICItemsDetail tfoot').find('td.difference').text("-");
                                $('#table_ICItemsDetail tfoot').find('td.costdifference').text("-");
                            }
                            var Item_Number = emptyStr(row.Item_Number) ? "" : row.Item_Number.trim();
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var LineItem_Option = emptyStr(row.LineItem_Option) ? 0 : row.LineItem_Option;
                            var Expected_Stock = emptyStr(row.Expected_Stock) ? 0 : row.Expected_Stock;
                            var Item_Cost = emptyStr(row.Item_Cost) ? 0 : row.Item_Cost;
                            GetDataICDetailEdit(Item_Number, LineItem_Option, Item_Description, Item_SKU, Expected_Stock, Item_Cost);
                            return Item_Cost_Different;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'p>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_ICItemsDetail').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataICCount() {
        try {
            var DOCNUMBER = emptyStr($('.countInvCount').find('#DOCNUMBER').val()) ? "" : $('.countInvCount').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }

            $('#table_countICItems tfoot').find('td.difference').text(0);
            $('#table_countICItems tfoot').find('td.costdifference').text(formatCurrency(0));

            $('#table_countICItems tbody').empty();
            $('#table_countICItems').DataTable().destroy();

            dtTableCount = $('#table_countICItems').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                orderable: false,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/InvCounts/ICGetDataDetail',
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
                        width: "40%",
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<input type="hidden" class="itemSKUvalue" value="' + Item_SKU + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100 itemSKU">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'Expected_Stock',
                        className: 'text-right vertical-middle expstock'
                    },
                    {
                        data: 'Counted_Stock',
                        className: 'text-right vertical-middle countstock',
                        render: function (data, type, row) {
                            var Counted_Stock = emptyStr(data) ? 0 : data;
                            var Item_Cost = emptyStr(row.Item_Cost) ? 0 : row.Item_Cost;
                            var html = '<input type="text" class="form-input text-right" name="number" value="' + data + '" id="Count_Stock" />' +
                                '<input type="hidden" value="' + Item_Cost + '" id="Item_Cost" />';
                            return html;
                        }
                    },
                    {
                        data: 'Different_Stock',
                        className: 'text-right vertical-middle diffstock'
                    },
                    {
                        data: 'Item_Cost_Different',
                        className: 'text-right vertical-middle diffcost',
                        render: function (data, type, row) {
                            var Item_Cost_Different = emptyStr(data) ? 0 : data;
                            return formatCurrency(Item_Cost_Different);
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'p>>",
                //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_countICItems').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function CountTotal() {
        try {
            var Total_Different_Stock = 0;
            var Total_Item_Cost_Different = 0;
            dtTableCount.rows().nodes().to$().each(function () {
                var diffStock = emptyStr($(this).find('td.diffstock').text()) ? 0 : $(this).find('td.diffstock').text();
                var diffCost = emptyStr($(this).find('td.diffcost').text()) ? 0 : $(this).find('td.diffcost').text();
                diffCost = delFormatCurrency(diffCost);
                Total_Different_Stock = Total_Different_Stock + parseFloat(diffStock);
                Total_Item_Cost_Different = Total_Item_Cost_Different + diffCost;
            });
            $('#table_countICItems tfoot').find('td.difference').text(Total_Different_Stock);
            $('#table_countICItems tfoot').find('td.costdifference').text(formatCurrency(Total_Item_Cost_Different));
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
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
        '#editInvCount': function (element, renderer) {
            return true;
        }
    };

    $('#saveasPDF, #saveasPDF2').click(function () {
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
                    pdf.save('Inventory Counts ' + currDate + '.pdf');
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

    $('input').focus(function () {
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

    $("#store").select2({
        dropdownParent: $("#store").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#site").select2({
        dropdownParent: $("#site").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/TransferItem/GetDataSites',
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

    $("#IC_SITE").select2({
        dropdownParent: $("#IC_SITE").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/TransferItem/GetDataSites',
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

    $('#btnSearch').on('click', function () {
        try {
            GetData();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#IC_NOTES").on("keyup", function () {
        try {
            var sumNotes = $(this).val().length;
            $('.addInvCount').find("#sumNotes").text(sumNotes + " / 500");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".ictype").on("click", function () {
        try {
            $(".ictype").prop("checked", false);
            $(this).prop("checked", true);
            var id = $(this).attr('id');
            $('.invItems').hide();
            if (!emptyStr(id)) {
                $('.' + id).show();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#SearchItem").select2({
        dropdownParent: $("#SearchItem").parent(),
        placeholder: "Search items",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Inventory/InvCounts/ICGetDataItems',
            type: 'POST',
            dataType: 'json',
            data: function (params) {
                var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val();
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

    $('#SearchItem, #IC_SITE').on("change", function () {
        try {
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
            ItemsInvCount();
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
            ItemsInvCount();
        } catch (err) {
            $(this).val(0);
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddInvCount').on("click", function () {
        try {
            $('.listInvCount').hide();
            $('.addInvCount').show();
            $('.editInvCount').hide();
            $('.countInvCount').hide();
            ClearNew();
            ItemsInvCount();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_countICItems tbody').on("focusin", "input[name=number]", function (e) {
        try {
            $(this).prop("autocomplete", "off");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_countICItems tbody').on("keyup", "input[name=number]", function (e) {
        try {
            var currow = $(this).closest('tr');
            var expStock = emptyStr(currow.find('td:eq(1)').text()) ? 0 : currow.find('td:eq(1)').text();
            var countStock = emptyStr($(this).val()) ? 0 : $(this).val();
            var diffStock = parseFloat(countStock) - parseFloat(expStock);
            var itemCost = emptyStr($(this).siblings('input#Item_Cost').val()) ? 0 : $(this).siblings('input#Item_Cost').val();
            var diffCost = parseFloat(diffStock) * parseFloat(itemCost);
            currow.find('td.diffstock').text(diffStock);
            currow.find('td.diffcost').text(formatCurrency(diffCost));
            CountTotal();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_countICItems tbody').on("keydown", "input[name=number]", function (e) {
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

    $("#table_countICItems tbody").on("paste", "input[name=number]", function (e) {
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

    $('#btnAddByCat').on("click", function () {
        try {
            var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val();
            if (emptyStr(Site_ID)) {
                swal({ type: "info", title: "Information", text: "Please choose Site" });
                return false;
            }
            $('#Modal_Lookup').modal('show');
            CategoryList();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_lookup thead').on('click', '#chkAll', function () {
        try {
            var checked = $(this).is(':checked');
            dtTableCat.rows().nodes().to$().each(function () {
                $(this).find('td:eq(0)').find('.chk').prop('checked', checked);
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_lookup tbody').on('click', 'tr input.chk', function () {
        try {
            var allItem = $('#table_lookup tbody tr').length;
            var perItem = 0;
            dtTableCat.rows().nodes().to$().each(function () {
                var checked = $(this).find('td:eq(0)').find('.chk').is(':checked');
                if (checked) {
                    perItem = perItem + 1;
                }
            });
            $('#table_lookup thead tr').find('#chkAll').prop('checked', false);
            if (allItem == perItem) {
                $('#table_lookup thead tr').find('#chkAll').prop('checked', true);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_invcount tbody').on("dblclick", 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var DOCNUMBER = emptyStr(currow.find('td:eq(0)').text()) ? "" : currow.find('td:eq(0)').text().trim();
            $('.listInvCount').hide();
            $('.addInvCount').hide();
            $('.countInvCount').hide();
            $('.editInvCount').show();
            ClearEdit();
            $('.editInvCount').find('#DOCNUMBER').val(DOCNUMBER);
            GetDataICHeader();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnEdit').on("click", function () {
        try {
            var DOCNUMBER = emptyStr($('.editInvCount').find('#DOCNUMBER').val()) ? "" : $('.editInvCount').find('#DOCNUMBER').val();
            $('.listInvCount').hide();
            $('.editInvCount').hide();
            $('.countInvCount').hide();
            $('.addInvCount').show();
            //ClearNew();
            var newOption = $("<option selected='selected'></option>").val("").text("");
            $('.addInvCount').find('#SearchItem').append(newOption);
            $('.addInvCount').find('#IC_NOTES').val("");
            $('.addInvCount').find('input.ictype').prop("checked", false);
            $('.addInvCount').find('input#IC_TYPE_PARTIAL').prop("checked", true);
            $('.addInvCount').find('#table_additem tbody tr').empty();
            $('.addInvCount').find('#table_additem tbody tr').remove();
            $('.addInvCount').find("#sumNotes").text("0 / 500");
            $('.addInvCount').find('#DOCNUMBER').val(DOCNUMBER);
            GetDataICHeaderEdit();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#Modal_Lookup').on('click', '#btnAddItemByCat', function () {
        try {
            var Category_ID = "";
            dtTableCat.rows().nodes().to$().each(function () {
                var checked = $(this).find('td:eq(0)').find('.chk').is(':checked');
                if (checked) {
                    var valCategory = emptyStr($(this).find('td:eq(0)').find('.chk').val()) ? "" : $(this).find('td:eq(0)').find('.chk').val();
                    Category_ID = emptyStr(Category_ID) ? valCategory : Category_ID + "," + valCategory;
                }
            });
            AddItemsByCat(Category_ID);
            $('#Modal_Lookup').modal('hide');
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

    $('#btnBackCount').on("click", function () {
        try {
            $('.listInvCount').hide();
            $('.addInvCount').hide();
            $('.editInvCount').show();
            $('.countInvCount').hide();
            $('.countInvCount').find('#DOCNUMBER').val("");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCancel').on("click", function () {
        try {
            var DOCNUMBER = emptyStr($('.addInvCount').find('#DOCNUMBER').val()) ? "" : $('.addInvCount').find('#DOCNUMBER').val()
            if (!emptyStr(DOCNUMBER)) {
                $('.listInvCount').hide();
                $('.addInvCount').hide();
                $('.countInvCount').hide();
                $('.editInvCount').show();
                ClearEdit();
                arrItems.length = 0;
                $('.editInvCount').find('#DOCNUMBER').val(DOCNUMBER);
                GetDataICHeader();
            } else {
                Clear();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSave').on("click", function (e) {
        try {
            e.preventDefault();
            var isValid = false;
            var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val(),
                Type_Inventory_Count = emptyStr($('.addInvCount').find(".ictype:checked").val()) ? 0 : $('.addInvCount').find(".ictype:checked").val();
            if (Type_Inventory_Count == 1) {
                dtTableItems.rows().nodes().to$().each(function () {
                    var qty = $(this).find('td.expstock').text();
                    if (!emptyStr(qty)) {
                        isValid = true;
                    }
                });
            }
            if (!isValid) {
                swal({ type: "info", title: "Information", text: "Please fill items." });
            } else if (emptyStr(Site_ID)) {
                swal({ type: "info", title: "Information", text: "Please choose site." });
            } else {
                swal({
                    title: "Count Items",
                    text: "Are you sure want to save this items?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Yes',
                    cancelButtonText: "No",
                    closeOnConfirm: false,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true,
                    animation: 'slide-from-top',
                    allowEscapeKey: false,
                    allowOutsideClick: false,
                },
                    function (isConfirm) {
                        if (isConfirm) {
                            SaveCounts(1);
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSaveCount').on("click", function (e) {
        try {
            e.preventDefault();
            var isValid = false;
            var Site_ID = emptyStr($('.addInvCount').find('#IC_SITE').val()) ? "" : $('.addInvCount').find('#IC_SITE').val(),
                Type_Inventory_Count = emptyStr($('.addInvCount').find(".ictype:checked").val()) ? 0 : $('.addInvCount').find(".ictype:checked").val();
            if (Type_Inventory_Count == 1) {
                dtTableItems.rows().nodes().to$().each(function () {
                    var qty = $(this).find('td.expstock').text();
                    if (!emptyStr(qty)) {
                        isValid = true;
                    }
                });
            }
            if (!isValid) {
                swal({ type: "info", title: "Information", text: "Please fill items." });
            } else if (emptyStr(Site_ID)) {
                swal({ type: "info", title: "Information", text: "Please choose site." });
            } else {
                swal({
                    title: "Count Items",
                    text: "Are you sure want to save and count this items?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Yes',
                    cancelButtonText: "No",
                    closeOnConfirm: false,
                    closeOnCancel: true,
                    showLoaderOnConfirm: true,
                    animation: 'slide-from-top',
                    allowEscapeKey: false,
                    allowOutsideClick: false,
                },
                    function (isConfirm) {
                        if (isConfirm) {
                            SaveCounts(2);
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCountStock').on("click", function () {
        try {
            $('.listInvCount').hide();
            $('.addInvCount').hide();
            $('.editInvCount').hide();
            $('.countInvCount').show();
            var DOCNUMBER = emptyStr($('.editInvCount').find('#DOCNUMBER').html()) ? "" : $('.editInvCount').find('#DOCNUMBER').html();
            $('.countInvCount').find('#DOCNUMBER').val(DOCNUMBER);
            GetDataICCount();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#SaveCount').on("click", function (e) {
        try {
            e.preventDefault();
            swal({
                title: "Count Items",
                text: "Are you sure want to save this items?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes',
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: true,
                showLoaderOnConfirm: true,
                animation: 'slide-from-top',
                allowEscapeKey: false,
                allowOutsideClick: false,
            },
                function (isConfirm) {
                    if (isConfirm) {
                        SaveComplete(2);
                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#CompleteCount').on("click", function (e) {
        try {
            e.preventDefault();
            swal({
                title: "Count Items",
                text: "Are you sure want to complete count this items?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes',
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: true,
                showLoaderOnConfirm: true,
                animation: 'slide-from-top',
                allowEscapeKey: false,
                allowOutsideClick: false,
            },
                function (isConfirm) {
                    if (isConfirm) {
                        SaveComplete(3);
                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});