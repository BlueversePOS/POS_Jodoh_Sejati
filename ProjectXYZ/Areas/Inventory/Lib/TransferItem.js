$(document).ready(function () {

    const dtValues = [
        { INV_TRANSFERITEM: "TO1002", INV_DATE: "2023-09-19 09:27:00", INV_DATERCV: "1900-01-01 00:00:00", INV_SOURCESITE: "GD001", INV_DESTSITE: "GD002", INV_STATUS: 1 /*in transit*/, QUANTITY: 2 },
        { INV_TRANSFERITEM: "TO1001", INV_DATE: "2023-09-19 09:26:00", INV_DATERCV: "2023-09-19 00:00:00", INV_SOURCESITE: "GD001", INV_DESTSITE: "GD002", INV_STATUS: 2 /*transferred*/, QUANTITY: 2 }
    ];

    const sStatus = [
        { id: 1, text: "In transit" },
        { id: 2, text: "Transferred" }
    ]

    var arrItems = [];
    var itemArr = [];
    var dtItems = [];

    $(".main-header").find(".title").html("Transfer Item");

    Clear();

    function Clear() {
        $('.listTfItem').find("select option:selected").val('');
        $('.listTfItem').find("select").val('');
        $('.listTfItem').find("select").text('');
        $('.listTfItem').find("select").html('');

        $("#status").select2({
            dropdownParent: $("#status").parent(),
            placeholder: "All",
            multiple: false,
            allowClear: true,
            width: "100%",
            data: sStatus
        });
        $('.listTfItem').find("#status").val(null).trigger("change");

        $('.listTfItem').show();
        $('.addTfItem').hide();
        $('.editTfItem').hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            var Status = emptyStr($('.listTfItem').find('#status').val()) ? 0 : $('.listTfItem').find('#status').val();
            var SourceSite_ID = emptyStr($('.listTfItem').find("#source_site").val()) ? "" : $('.listTfItem').find("#source_site").val();
            var DestSite_ID = emptyStr($('.listTfItem').find("#dest_site").val()) ? "" : $('.listTfItem').find("#dest_site").val();
            var model = {
                Status: Status,
                SourceSite_ID: SourceSite_ID,
                DestSite_ID: DestSite_ID
            }

            $('#table_transferitem tbody').empty();
            $('#table_transferitem').DataTable().destroy();

            dtTable = $('#table_transferitem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/TransferItem/TrfItemGetDataTransfer',
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
                    {
                        data: 'DATERECEIVED',
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
                    { data: 'SourceSite_Name' },
                    { data: 'DestSite_Name' },
                    {
                        data: 'Status',
                        render: function (data, type, row) {
                            var status = emptyStr(data) ? "" : data;
                            if (status == 1) {
                                status = "<span>In transit</span>";
                            } else if (status == 2) {
                                status = "<span class='text-gray'>Transferred</span>";
                            }
                            return status;
                        }
                    },
                    {
                        data: 'Qty_Transfer',
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
            $('#table_transferitem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
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

    function ClearNew() {
        $('.addTfItem').find('#table_additem tbody tr').empty();
        $('.addTfItem').find('#table_additem tbody tr').remove();
        $('.addTfItem').find('#DOCNUMBER').val("");
        //$('.addTfItem').find("select").val(null).trigger("change");
        var newOption = $("<option selected='selected'></option>").val("").text("");
        $('.addTfItem').find('#TF_SOURCE_SITE').append(newOption);
        newOption = $("<option selected='selected'></option>").val("").text("");
        $('.addTfItem').find('#TF_DEST_SITE').append(newOption);
        newOption = $("<option selected='selected'></option>").val("").text("");
        $('.addTfItem').find('#SearchItem').append(newOption);
        $('.addTfItem').find('.datetimepicker-input').val(moment(new Date()).format($('#dafor').val()));
        $('.addTfItem').find('#TFNOTES').val("");
        $('.addTfItem').find("#sumNotes").text("0 / 500");
        arrItems.length = 0;
        itemArr.length = 0;
        dtItems.length = 0;
    }

    function ClearEdit() {
        $('.editTfItem').find('#DOCNUMBER').html("");
        $('.editTfItem').find('#TFSTATUS_ITEM').html("");
        $('.editTfItem').find('#TFDATEITEM').html("");
        $('.editTfItem').find('#TFORDERBY').html("");
        $('.editTfItem').find('#table_additem tbody tr').empty();
        $('.editTfItem').find('#table_additem tbody tr').remove();
        $('.editTfItem').find('#table_sourcedest tbody tr').empty();
        $('.editTfItem').find('#table_sourcedest tbody tr').remove();
        $('.editTfItem').find('#table_TfItemsDetail tbody tr').empty();
        $('.editTfItem').find('#table_TfItemsDetail tbody tr').remove();
        $('.editTfItem').find('#saveasPDF').hide();
        $('.editTfItem').find('#saveasCSV').hide();
        $('.editTfItem').find('#btnReceive').hide();
        $('.editTfItem').find('#btnEdit').hide();
        $('.editTfItem').find('.dropdown').hide();
        arrItems.length = 0;
    }

    function AllItems() {
        try {
            var Item_Number = emptyStr($('#SearchItem').val()) ? "#" : $('#SearchItem').val();
            var SourceSite_ID = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE").val()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE").val();
            var DestSite_ID = emptyStr($('.addTfItem').find("#TF_DEST_SITE").val()) ? "" : $('.addTfItem').find("#TF_DEST_SITE").val();
            var LineItem_Option = 0;
            if (Item_Number != "#") {
                var splitVal = Item_Number.split("|");
                Item_Number = emptyStr(splitVal[0]) ? "#" : splitVal[0];
                LineItem_Option = emptyStr(splitVal[1]) ? 0 : splitVal[1];
            }
            var model = {
                Item_Number: Item_Number,
                SourceSite_ID: SourceSite_ID,
                DestSite_ID: DestSite_ID,
                LineItem_Option: LineItem_Option
            }

            $('#table_additem tbody').empty();
            $('#table_additem').DataTable().destroy();

            dtTableItems = $('#table_additem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
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
                        data: 'SourceStock',
                        className: 'text-right vertical-middle Source_Stock'
                    },
                    {
                        data: 'DestinationStock',
                        className: 'text-right vertical-middle Dest_Stock'
                    },
                    {
                        data: 'Item_Number',
                        orderable: false,
                        className: 'vertical-middle qty',
                        render: function (data, type, row) {
                            var qty = 0;
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            if (itemArr.length > 0) {
                                $.each(itemArr, function (i, x) {
                                    var itemnumber = emptyStr(x.Item_Number) ? "" : x.Item_Number;
                                    var itemsku = emptyStr(x.Item_SKU) ? "" : x.Item_SKU;
                                    var qtytf = emptyStr(x.QTY_Transfer) ? "" : x.QTY_Transfer;
                                    if (itemnumber == Item_Number && itemsku == Item_SKU) {
                                        qty = qtytf;
                                    }
                                });
                            }
                            var html = '<input type="text" name="number" class="form-input text-right" value="' + qty + '" />';
                            return html;
                        }
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
            var SourceSite_ID = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE").val()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE").val();
            var DestSite_ID = emptyStr($('.addTfItem').find("#TF_DEST_SITE").val()) ? "" : $('.addTfItem').find("#TF_DEST_SITE").val();
            var LineItem_Option = 0;
            if (Item_Number != "#") {
                var splitVal = Item_Number.split("|");
                Item_Number = emptyStr(splitVal[0]) ? "#" : splitVal[0];
                LineItem_Option = emptyStr(splitVal[1]) ? 0 : splitVal[1];
            }
            var model = {
                Item_Number: Item_Number,
                SourceSite_ID: SourceSite_ID,
                DestSite_ID: DestSite_ID,
                LineItem_Option: LineItem_Option
            }
            $.ajax({
                url: rootUrl + "Inventory/TransferItem/TrfItemGetItemBySite",
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
                                SourceStock = emptyStr(values.SourceStock) ? 0 : values.SourceStock,
                                DestinationStock = emptyStr(values.DestinationStock) ? 0 : values.DestinationStock,
                                Item_SKU = emptyStr(values.Item_SKU) ? "" : values.Item_SKU.trim();

                            var exists = false;
                            if (arrItems.length > 0) {
                                $.map(arrItems, function (x) {
                                    var Item_Numberlist = emptyStr(x.Item_Number) ? "" : x.Item_Number.trim();
                                    var LineItem_Optionlist = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option;
                                    if (Item_Number == Item_Numberlist && LineItem_Option == LineItem_Optionlist) {
                                        exists = true;
                                        x.SourceStock = SourceStock;
                                        x.DestinationStock = DestinationStock;
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
                                    'SourceStock': SourceStock,
                                    'DestinationStock': DestinationStock,
                                    'Item_SKU': Item_SKU
                                });
                            }
                            AllItems();
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

    function SaveTransfer(Status) {
        try {
            var DOCNUMBER = emptyStr($('.addTfItem').find('#DOCNUMBER').val()) ? "" : $('.addTfItem').find('#DOCNUMBER').val(),
                SourceSite_ID = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE").val()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE").val(),
                SourceSite_Name = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE :selected").text()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE :selected").text(),
                DestSite_ID = emptyStr($('.addTfItem').find("#TF_DEST_SITE").val()) ? "" : $('.addTfItem').find("#TF_DEST_SITE").val(),
                DestSite_Name = emptyStr($('.addTfItem').find("#TF_DEST_SITE :selected").text()) ? "" : $('.addTfItem').find("#TF_DEST_SITE :selected").text(),
                DOCDATE = moment($('.addTfItem').find('#TFDATEITEM').val(), $('#dafor').val()).format('YYYY-MM-DD'),
                Notes = emptyStr($('.addTfItem').find("#TFNOTES").val()) ? "" : $('.addTfItem').find("#TFNOTES").val();
            Status = emptyStr(Status) ? 0 : Status;

            //#region Items

            var items = [];
            var Lineitmseq = 0;
            var Total_Line_Item = 0;
            $.each($('#table_additem tbody tr'), function () {
                var Item_Number = emptyStr($(this).find('td:eq(0) .itemnumber').val()) ? "" : $(this).find('td:eq(0) .itemnumber').val();
                var Item_Description = emptyStr($(this).find('td:eq(0) .itemdesc').text()) ? "" : $(this).find('td:eq(0) .itemdesc').text().trim();
                var LineItem_Option = emptyStr($(this).find('td:eq(0) .LineItem_Option').val()) ? "" : $(this).find('td:eq(0) .LineItem_Option').val();
                var Item_SKU = emptyStr($(this).find('td:eq(0) .itemSKUvalue').val()) ? "" : $(this).find('td:eq(0) .itemSKUvalue').val();
                var Source_Stock = emptyStr($(this).find('td.Source_Stock').text()) ? 0 : $(this).find('td.Source_Stock').text().trim();
                var Dest_Stock = emptyStr($(this).find('td.Dest_Stock').text()) ? 0 : $(this).find('td.Dest_Stock').text().trim();
                var Qty_Transfer = emptyStr($(this).find('td.qty input').val()) ? 0 : $(this).find('td.qty input').val();

                if (parseFloat(Qty_Transfer) > 0 && parseFloat(Qty_Transfer) <= parseFloat(Source_Stock)) {
                    Total_Line_Item = Total_Line_Item + 1;
                    items.push({
                        'DOCDATE': DOCDATE,
                        'Lineitmseq': parseInt(Total_Line_Item) * 10,
                        'Item_Number': Item_Number,
                        'LineItem_Option': LineItem_Option,
                        'Item_Description': Item_Description,
                        'Item_SKU': Item_SKU,
                        'Source_Stock': Source_Stock,
                        'Dest_Stock': Dest_Stock,
                        'Qty_Transfer': Qty_Transfer
                    });
                }
            });

            //#endregion

            var model = {
                'DOCNUMBER': DOCNUMBER,
                'DOCDATE': DOCDATE,
                'SourceSite_ID': SourceSite_ID,
                'SourceSite_Name': SourceSite_Name,
                'DestSite_ID': DestSite_ID,
                'DestSite_Name': DestSite_Name,
                'Total_Line_Item': Total_Line_Item,
                'Notes': Notes,
                'Status': Status,
                'TrfDetails': items
            }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            var txtSwal = "Transfer item created successfully";
            if (Status == 2) {
                txtSwal = "Transfer item created and received successfully";
            }

            $.ajax({
                url: rootUrl + 'Inventory/TransferItem/TrfItemSaveTransfer',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        Clear();
                        swal({ type: "success", title: "Success", html: true, text: "<span>" + txtSwal + " with document number <b>" + result.message + "</b></span>" });
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

    function GetDataTransferHeader() {
        try {
            var DOCNUMBER = emptyStr($('.editTfItem').find('#DOCNUMBER').text()) ? "" : $('.editTfItem').find('#DOCNUMBER').text().trim();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/TransferItem/TrfItemGetDataHeader",
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
                    GetDataTransferDetail();
                },
                success: function (data) {
                    if (data.success) {
                        $.each(data.data, function (index, values) {
                            var DOCNUMBER = emptyStr(values.DOCNUMBER) ? "" : values.DOCNUMBER.trim(),
                                DOCDATE = moment(values.DOCDATE).format($('#dafor').val()),
                                SourceSite_ID = emptyStr(values.SourceSite_ID) ? "" : values.SourceSite_ID.trim(),
                                SourceSite_Name = emptyStr(values.SourceSite_Name) ? "" : values.SourceSite_Name.trim(),
                                DestSite_ID = emptyStr(values.DestSite_ID) ? "" : values.DestSite_ID.trim(),
                                DestSite_Name = emptyStr(values.DestSite_Name) ? "" : values.DestSite_Name.trim(),
                                Total_Line_Item = emptyStr(values.Total_Line_Item) ? 0 : values.Total_Line_Item,
                                Notes = emptyStr(values.Notes) ? "" : values.Notes.trim(),
                                Status = emptyStr(values.Status) ? 0 : values.Status,
                                Role_Name = emptyStr(values.Role_Name) ? "" : values.Role_Name.trim();
                            var statusTXT = "";
                            if (Status == 1) {
                                statusTXT = "In transit";
                            } else if (Status == 2) {
                                statusTXT = "Transferred";
                            }
                            $('.editTfItem').find('#StatusTF').val(Status);
                            $('.editTfItem').find('#DOCNUMBER').html(DOCNUMBER);
                            $('.editTfItem').find('#TFSTATUS_ITEM').html(statusTXT + " (" + DOCDATE + ")");
                            $('.editTfItem').find('#TFDATEITEM').html(DOCDATE);
                            $('.editTfItem').find('#TFORDERBY').html(Role_Name);
                            var htmlSite = '<tr><td>' + SourceSite_ID + '</td>' +
                                '<td>' + DestSite_ID + '</td></tr>' +
                                '<tr><td>' + SourceSite_Name + '</td>' +
                                '<td>' + DestSite_Name + '</td></tr > ';
                            $('.editTfItem').find('#table_sourcedest tbody').append(htmlSite);

                            $('.editTfItem').find('#saveasPDF').hide();
                            $('.editTfItem').find('#saveasCSV').hide();
                            $('.editTfItem').find('#btnReceive').show();
                            $('.editTfItem').find('#btnEdit').show();
                            $('.editTfItem').find('.dropdown').show();
                            if (Status == 2) {
                                $('.editTfItem').find('#saveasPDF').show();
                                $('.editTfItem').find('#saveasCSV').show();
                                $('.editTfItem').find('#btnReceive').hide();
                                $('.editTfItem').find('#btnEdit').hide();
                                $('.editTfItem').find('.dropdown').hide();
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
    };

    function GetDataTransferDetail() {
        try {
            var DOCNUMBER = emptyStr($('.editTfItem').find('#DOCNUMBER').text()) ? "" : $('.editTfItem').find('#DOCNUMBER').text().trim();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }

            $('#table_TfItemsDetail tbody').empty();
            $('#table_TfItemsDetail').DataTable().destroy();

            dtTableDetail = $('#table_TfItemsDetail').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/TransferItem/TrfItemGetDataDetail',
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
                        width: '85%',
                        className: 'no-wrap',
                        orderable: false,
                        render: function (data, type, row) {
                            var Item_Description = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                            var Item_SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                            var Item_Number = emptyStr(data) ? "" : data.trim();
                            var html = '<div class="row mx-0 col-12 px-0">' +
                                '<input type="hidden" class="itemnumber" value="' + Item_Number + '" />' +
                                '<span class="w-100 itemdesc">' + Item_Description + '</span>' +
                                '<span class="w-100 spanselect">SKU ' + Item_SKU + '</span>' +
                                '</div>';
                            return html;
                        }
                    },
                    {
                        data: 'Qty_Transfer',
                        className: 'text-right vertical-middle',
                        orderable: false
                    },
                ],
                order: [],
                dom: "<'row'<'col-12'f>>" +
                    "<'row'<'col-12'tr>>" +
                    "<'row'<'col-12'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_TfItemsDetail').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function GetEditTransferHeader() {
        try {
            var DOCNUMBER = emptyStr($('.addTfItem').find('#DOCNUMBER').val()) ? "" : $('.addTfItem').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/TransferItem/TrfItemGetDataHeader",
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
                                DOCDATE = moment(values.DOCDATE).format($('#dafor').val()),
                                SourceSite_ID = emptyStr(values.SourceSite_ID) ? "" : values.SourceSite_ID.trim(),
                                SourceSite_Name = emptyStr(values.SourceSite_Name) ? "" : values.SourceSite_Name.trim(),
                                DestSite_ID = emptyStr(values.DestSite_ID) ? "" : values.DestSite_ID.trim(),
                                DestSite_Name = emptyStr(values.DestSite_Name) ? "" : values.DestSite_Name.trim(),
                                Total_Line_Item = emptyStr(values.Total_Line_Item) ? 0 : values.Total_Line_Item,
                                Notes = emptyStr(values.Notes) ? "" : values.Notes.trim(),
                                Status = emptyStr(values.Status) ? 0 : values.Status,
                                Role_Name = emptyStr(values.Role_Name) ? "" : values.Role_Name.trim();
                            var statusTXT = "";
                            if (Status == 1) {
                                statusTXT = "In transit";
                            } else if (Status == 2) {
                                statusTXT = "Transferred";
                            }
                            var newOption = $("<option selected='selected'></option>").val(SourceSite_ID).text(SourceSite_Name);
                            $('.addTfItem').find('#TF_SOURCE_SITE').append(newOption).trigger('change');
                            newOption = $("<option selected='selected'></option>").val(DestSite_ID).text(DestSite_Name);
                            $('.addTfItem').find('#TF_DEST_SITE').append(newOption).trigger('change');
                            $('.addTfItem').find('#TFDATEITEM').val(DOCDATE);
                            $('.addTfItem').find('#TFNOTES').val(Notes);
                            GetEditTransferDetail();
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

    function GetEditTransferDetail() {
        try {
            var DOCNUMBER = emptyStr($('.addTfItem').find('#DOCNUMBER').val()) ? "" : $('.addTfItem').find('#DOCNUMBER').val();
            var model = {
                'DOCNUMBER': DOCNUMBER
            }
            $.ajax({
                url: rootUrl + "Inventory/TransferItem/TrfItemGetDataDetail",
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
                            var DOCNUMBER = emptyStr(values.DOCNUMBER) ? "" : values.DOCNUMBER.trim(),
                                DOCDATE = moment(values.DOCDATE).format($('#dafor').val()),
                                Lineitmseq = emptyStr(values.Lineitmseq) ? 0 : values.Lineitmseq,
                                Item_Number = emptyStr(values.Item_Number) ? "" : values.Item_Number.trim(),
                                LineItem_Option = emptyStr(values.LineItem_Option) ? 0 : values.LineItem_Option,
                                Item_Description = emptyStr(values.Item_Description) ? "" : values.Item_Description.trim(),
                                Item_SKU = emptyStr(values.Item_SKU) ? "" : values.Item_SKU.trim(),
                                Source_Stock = emptyStr(values.Source_Stock) ? 0 : values.Source_Stock,
                                Dest_Stock = emptyStr(values.Dest_Stock) ? 0 : values.Dest_Stock,
                                Qty_Transfer = emptyStr(values.Qty_Transfer) ? 0 : values.Qty_Transfer;
                            var newOption = $("<option selected='selected'></option>").val(Item_Number + "|" + LineItem_Option).text(Item_Description);
                            $('.addTfItem').find('#SearchItem').append(newOption).trigger('change');
                            itemArr.push({
                                'Item_Number': Item_Number,
                                'Item_SKU': Item_SKU,
                                'QTY_Transfer': Qty_Transfer
                            });
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
                AllItems();
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function ReceiveItem(Status) {
        try {
            var DOCNUMBER = emptyStr($('.editTfItem').find('#DOCNUMBER').text()) ? "" : $('.editTfItem').find('#DOCNUMBER').text().trim();
            Status = emptyStr(Status) ? 0 : Status;

            var model = {
                'DOCNUMBER': DOCNUMBER,
                'Status': Status
            }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            var txtSwal = "";
            if (Status == 2) {
                txtSwal = "received successfully";
            } else if (Status == 0) {
                txtSwal = "deleted successfully";
            }

            $.ajax({
                url: rootUrl + 'Inventory/TransferItem/TrfItemReceiveItem',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        Clear();
                        swal({ type: "success", title: "Success", html: true, text: "<span>Document number <b>" + result.message + "</b> " + txtSwal + "</span>" });
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

    function RestoreQty() {
        $.each($('#table_additem tbody tr'), function () {
            var currow = $(this);
            var itemnumber = emptyStr(currow.find('td:eq(0) input.itemnumber').val()) ? "" : currow.find('td:eq(0) input.itemnumber').val();
            var LineItem_Option = emptyStr(currow.find('td:eq(0) input.LineItem_Option').val()) ? 0 : currow.find('td:eq(0) input.LineItem_Option').val();
            var Item_SKU = emptyStr(currow.find('td:eq(0) input.itemSKUvalue').val()) ? 0 : currow.find('td:eq(0) input.itemSKUvalue').val();
            $.each(dtItems, function (i, x) {
                var Item_Number2 = emptyStr(x.Item_Number) ? 0 : x.Item_Number.trim(),
                    LineItem_Option2 = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option,
                    Item_SKU2 = emptyStr(x.Item_SKU) ? 0 : x.Item_SKU,
                    QTY_Transfer = emptyStr(x.QTY_Transfer) ? 0 : x.QTY_Transfer;
                if (itemnumber == Item_Number2 && LineItem_Option == LineItem_Option2 && Item_SKU == Item_SKU2) {
                    currow.find('td.qty input').val(QTY_Transfer);
                }
            });
        });
    }

    function BackupQty() {
        dtItems.length = 0;
        $.each($('#table_additem tbody tr'), function () {
            var currow = $(this);
            var Item_Number = emptyStr(currow.find('td:eq(0) input.itemnumber').val()) ? "" : currow.find('td:eq(0) input.itemnumber').val();
            var LineItem_Option = emptyStr(currow.find('td:eq(0) input.LineItem_Option').val()) ? 0 : currow.find('td:eq(0) input.LineItem_Option').val();
            var Item_SKU = emptyStr(currow.find('td:eq(0) input.itemSKUvalue').val()) ? 0 : currow.find('td:eq(0) input.itemSKUvalue').val();
            var QTY_Transfer = emptyStr(currow.find('td.qty input').val()) ? 0 : currow.find('td.qty input').val();
            dtItems.push({
                'Item_Number': Item_Number,
                'LineItem_Option': LineItem_Option,
                'Item_SKU': Item_SKU,
                'QTY_Transfer': QTY_Transfer
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
                    pdf.save('Transfer Item ' + currDate + '.pdf');
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

    $('.datetimepicker-input').datetimepicker({
        format: $('#dafor').val().toUpperCase()
        //, defaultDate: new Date()
    });

    $("#source_site").select2({
        dropdownParent: $("#source_site").parent(),
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

    $("#dest_site").select2({
        dropdownParent: $("#dest_site").parent(),
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

    $("#TF_SOURCE_SITE").select2({
        dropdownParent: $("#TF_SOURCE_SITE").parent(),
        placeholder: "select site",
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
                var DEST_SITE = emptyStr($("#TF_DEST_SITE").val()) ? "" : $("#TF_DEST_SITE").val();
                if (data.data.length != 0 && !emptyStr(DEST_SITE)) {
                    data.data = $.grep(data.data, function (e) {
                        var Site_ID = e.Site_ID.trim();
                        if (Site_ID != DEST_SITE) {
                            return true;
                        } else {
                            return false;
                        }
                    });
                }
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

    $("#TF_DEST_SITE").select2({
        dropdownParent: $("#TF_DEST_SITE").parent(),
        placeholder: "select site",
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
                var SOURCE_SITE = emptyStr($("#TF_SOURCE_SITE").val()) ? "" : $("#TF_SOURCE_SITE").val();
                if (data.data.length != 0 && !emptyStr(SOURCE_SITE)) {
                    data.data = $.grep(data.data, function (e) {
                        var Site_ID = e.Site_ID.trim();
                        if (Site_ID != SOURCE_SITE) {
                            return true;
                        } else {
                            return false;
                        }
                    });
                }
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
            url: rootUrl + 'Inventory/TransferItem/TrfItemSearchItemBySite',
            type: 'POST',
            dataType: 'json',
            data: function (params) {
                var SourceSite_ID = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE").val()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE").val();
                var DestSite_ID = emptyStr($('.addTfItem').find("#TF_DEST_SITE").val()) ? "" : $('.addTfItem').find("#TF_DEST_SITE").val();
                var model = {
                    Item_Number: "",
                    LineItem_Option: 0,
                    SourceSite_ID: SourceSite_ID,
                    DestSite_ID: DestSite_ID
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

    $('#btnSearch').on('click', function () {
        try {
            GetData();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#TFNOTES").on("keyup", function () {
        try {
            var sumNotes = $(this).val().length;
            $('.addTfItem').find("#sumNotes").text(sumNotes + " / 500");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddTfItem').on("click", function () {
        try {
            $('.listTfItem').hide();
            $('.addTfItem').show();
            $('.editTfItem').hide();
            ClearNew();
            AllItems();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#TF_SOURCE_SITE, #TF_DEST_SITE').on('change', function () {
        try {
            BackupQty();
            if (arrItems.length > 0) {
                $.each(arrItems, function (i, x) {
                    var Item_Number = emptyStr(x.Item_Number) ? "" : x.Item_Number.trim();
                    var LineItem_Option = emptyStr(x.LineItem_Option) ? 0 : x.LineItem_Option;
                    var Item_Description = emptyStr(x.Item_Description) ? "" : x.Item_Description.trim();
                    var newOption = $("<option selected='selected'></option>").val(Item_Number + "|" + LineItem_Option).text(Item_Description);
                    $('#SearchItem').append(newOption);
                    AddItems(false);
                });
            } else {
                AddItems(false);
            }
            RestoreQty();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#SearchItem').on('change', function () {
        try {
            BackupQty();
            AddItems(true);
            RestoreQty();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on('focusin', '.qty input', function () {
        try {
            $(this).prop("autocomplete", "off");
        } catch (err) {
            $(this).val(0);
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on('keyup', '.qty input', function () {
        try {
            var currow = $(this).closest('tr');
            var qty = $(this).val();
            var SourceStock = emptyStr(currow.find('td:eq(1)').text()) ? 0 : currow.find('td:eq(1)').text().trim();
            var SourceSite_ID = emptyStr($('.addTfItem').find("#TF_SOURCE_SITE").val()) ? "" : $('.addTfItem').find("#TF_SOURCE_SITE").val();
            var DestSite_ID = emptyStr($('.addTfItem').find("#TF_DEST_SITE").val()) ? "" : $('.addTfItem').find("#TF_DEST_SITE").val();
            if (emptyStr(DestSite_ID) || emptyStr(SourceSite_ID)) {
                $(this).val(0);
                swal({ type: "info", title: "Information", text: "Please choose source and destination site." });
                return false;
            }
            if (parseFloat(qty) > parseFloat(SourceStock)) {
                $(this).val(SourceStock);
                swal({ type: "info", title: "Information", text: "Quantity exceeds the limit of source stock. Max quantity is " + SourceStock + "." });
            }
        } catch (err) {
            $(this).val(0);
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_additem tbody').on('click', '.deleteitem .btndel', function () {
        try {
            BackupQty();
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
            AllItems();
            RestoreQty();
        } catch (err) {
            $(this).val(0);
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_transferitem tbody').on("dblclick", "tr", function () {
        try {
            var currow = $(this).closest('tr');
            var dtEmpty = currow.find('.dataTables_empty').is(':visible');
            if (!dtEmpty) {
                var DOCNUMBER = emptyStr(currow.find('td:eq(0)').text()) ? "" : currow.find('td:eq(0)').text().trim();
                $('.listTfItem').hide();
                $('.addTfItem').hide();
                $('.editTfItem').show();
                ClearEdit();
                $('.editTfItem').find('#DOCNUMBER').text(DOCNUMBER);
                GetDataTransferHeader();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnBack, #btnCancel').on("click", function () {
        try {
            Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCreate').on("click", function (e) {
        try {
            e.preventDefault();
            var isValid = false;
            var DOCDATE = emptyStr($('.addTfItem').find('#TFDATEITEM').val()) ? "" : moment($('.addTfItem').find('#TFDATEITEM').val(), $('#dafor').val()).format('YYYY-MM-DD');
            dtTableItems.rows().nodes().to$().each(function () {
                var qty = $(this).find('td.qty').find('input').val();
                if (qty > 0) {
                    isValid = true;
                }
            });
            if (!isValid) {
                swal({ type: "info", title: "Information", text: "Cannot find item transfer." });
            } else if (emptyStr(DOCDATE) || DOCDATE <= "1900-01-01") {
                swal({ type: "info", title: "Information", text: "Please fill date of transfer item." });
            } else {
                swal({
                    title: "Create Transfer Items",
                    text: "Are you sure want to create this transfer item?",
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
                            SaveTransfer(1);
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCreateReceive').on("click", function (e) {
        try {
            e.preventDefault();
            var isValid = false;
            dtTableItems.rows().nodes().to$().each(function () {
                var qty = $(this).find('td.qty').find('input').val();
                if (qty > 0) {
                    isValid = true;
                }
            });
            if (!isValid) {
                swal({ type: "info", title: "Information", text: "Cannot find item transfer." });
            } else {
                swal({
                    title: "Receive Transfer Items",
                    text: "Are you sure want to create data and receive all item?",
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
                            SaveTransfer(2);
                        }
                    });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnReceive').on("click", function (e) {
        try {
            e.preventDefault();
            swal({
                title: "Receive Transfer Items",
                text: "Are you sure want to receive all item?",
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
                        ReceiveItem(2);
                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnEdit').on("click", function () {
        try {
            var DOCNUMBER = emptyStr($('.editTfItem').find('#DOCNUMBER').text()) ? "" : $('.editTfItem').find('#DOCNUMBER').text().trim();
            $('.listTfItem').hide();
            $('.addTfItem').show();
            $('.editTfItem').hide();
            ClearNew();
            $('.addTfItem').find('#DOCNUMBER').val(DOCNUMBER);
            GetEditTransferHeader();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#deleteTfItem').on("click", function (e) {
        try {
            e.preventDefault();
            swal({
                title: "Delete Items",
                text: "Are you sure want to delete this transfer item?",
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
                        ReceiveItem(0);
                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});