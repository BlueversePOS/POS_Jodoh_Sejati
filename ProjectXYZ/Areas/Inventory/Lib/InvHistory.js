$(document).ready(function () {

    const dtValues = [
        { INV_DATE: "2023-09-19 09:27:00", INV_ITEM: "Caramel machiato", INV_STORE: "JS STORE", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Receive items #SA1001", INV_ADJUSMENT: 2, INV_STORCKAFTER: 2 },
        { INV_DATE: "2023-09-19 09:26:00", INV_ITEM: "Caramel machiato", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1002", INV_ADJUSMENT: -2, INV_STORCKAFTER: 95 },
        { INV_DATE: "2023-09-19 08:31:00", INV_ITEM: "Kopi susu", INV_STORE: "JS STORE", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1001", INV_ADJUSMENT: 2, INV_STORCKAFTER: 2 },
        { INV_DATE: "2023-09-19 08:31:00", INV_ITEM: "Kopi susu", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_EMPLOYEE: "Owner", INV_REASON: "Transfer #TO1001", INV_ADJUSMENT: -2, INV_STORCKAFTER: 95 },
    ];

    var arrItems = [];

    $(".main-header").find(".title").html("Inventory History");

    Clear();

    function Clear() {
        $('#reportrange span').html(moment().subtract('days', 29).format($("#dafor").val()) + ' - ' + moment().format($("#dafor").val()));
        $('#reportrange').daterangepicker(
            {
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate: moment()
            },
            function (start, end) {
                var filterDate = start.format($("#dafor").val()) + ' - ' + end.format($("#dafor").val());
                if (start.format("YYYY-MM-DD") <= "1900-01-01") {
                    filterDate = "All";
                }
                $('#reportrange span').html(filterDate);
                GetData();
            }
        );
        $('.dropdown-menu.allStore').empty();
        $('.dropdown-menu.allSite').empty();
        $('.dropdown-menu.allEmployee').empty();

        $('div#bodyList').show();
        $('div.editStockAdj').hide();
        $('div.editTfItem').hide();
        $('div.editInvCount').hide();
        $('div#bodyDetail').hide();

        GetAllStore();
        GetAllSite();
        GetAllEmployee();
        GetData();
        FuncCheckbox("allReasons");
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

    function GetModels() {
        var startDate = $('#reportrange').data('daterangepicker').startDate._d;
        var endDate = $('#reportrange').data('daterangepicker').endDate._d;
        startDate = moment(startDate).format('YYYY-MM-DD');
        endDate = moment(endDate).format('YYYY-MM-DD');
        var Reason = "", Employee = "", Store_ID = "", Site_ID = "";
        $.each($('ul.allStore').find('input[name="allStore"]:not(#checkall)'), function () {
            var checked = $(this).is(":checked");
            if (checked) {
                var val = emptyStr($(this).val()) ? "" : $(this).val();
                Store_ID = emptyStr(Store_ID) ? val : Store_ID + "," + val;
            }
        });
        $.each($('ul.allSite').find('input[name="allSite"]:not(#checkall)'), function () {
            var checked = $(this).is(":checked");
            if (checked) {
                var val = emptyStr($(this).val()) ? "" : $(this).val();
                Site_ID = emptyStr(Site_ID) ? val : Site_ID + "," + val;
            }
        });
        $.each($('ul.allEmployee').find('input[name="allEmployee"]:not(#checkall)'), function () {
            var checked = $(this).is(":checked");
            if (checked) {
                var val = emptyStr($(this).val()) ? "" : $(this).val();
                Employee = emptyStr(Employee) ? val : Employee + "," + val;
            }
        });
        $.each($('ul.allReasons').find('input[name="allReasons"]:not(#checkall)'), function () {
            var checked = $(this).is(":checked");
            if (checked) {
                var val = emptyStr($(this).val()) ? "" : $(this).val();
                Reason = emptyStr(Reason) ? val : Reason + "," + val;
            }
        });
        var SEARCH = $("#SEARCH").val();
        var model = {
            'FILTER': 1,
            'DateFrom': startDate,
            'DateTo': endDate,
            'Reason': Reason,
            'Employee': Employee,
            'Store_ID': Store_ID,
            'Site_ID': Site_ID,
            'SEARCH': SEARCH
        }

        return model;
    }

    function GetData() {
        try {
            var model = GetModels();

            $('#table_invhistory tbody').empty();
            $('#table_invhistory').DataTable().destroy();

            dtTable = $('#table_invhistory').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Inventory/InvHistory/InvHistGetDataList',
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
                        data: 'DOCDATE',
                        render: function (data, type, row) {
                            var date = moment(data).format("YYYY-MM-DD") <= "1900-01-01" ? "" : moment(data).format("MMM DD, YYYY hh:mm");
                            return date;
                        }
                    },
                    { data: 'Item_Description' },
                    {
                        data: 'Site_ID',
                        width: "1px"
                    },
                    {
                        data: 'Site_ID',
                        width: "1px"
                    },
                    {
                        data: 'Username',
                        width: "1px"
                    },
                    {
                        data: 'Reason',
                        className: 'HISTNUMBER',
                        render: function (data, type, row) {
                            var Reason = emptyStr(data) ? "" : data.trim();
                            var DOCNUMBER = emptyStr(row.DOCNUMBER) ? "" : row.DOCNUMBER.trim();
                            return '<span class="reason">' + Reason + '</span><span class="text-success docnumber" style="cursor: pointer;"> #'+DOCNUMBER+'</span>';
                        }
                    },
                    {
                        data: 'QTY_Adjustment',
                        width: "1px",
                        className: 'text-right'
                    },
                    {
                        data: 'Qty_After_Stock',
                        width: "1px",
                        className: 'text-right'
                    }
                ],
                dom: "<'row'<'col-6 col-sm-6 col-md-6 col-lg-6'l><'col-6 col-sm-6 col-md-6 col-lg-6'>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'col-6 col-sm-6 col-md-6 col-lg-6'i><'col-6 col-sm-6 col-md-6 col-lg-6'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_invhistory').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetAllStore() {
        try {
            $.ajax({
                url: rootUrl + "Inventory/InvHistory/GetDataStores",
                type: "GET",
                //async: false,
                dataType: "json",
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (data) {
                    if (data.success) {
                        var ddlValue = '<li>' +
                            '<label>' +
                            '<input type="checkbox" id="checkall" name="allStore" checked> All store' +
                            '</label>' +
                            '<hr style="height: 0.1px; border-width: 0; color: gray; background-color: gray; margin: 0px 0px 8px 0px" />' +
                            '</li>';
                        $.each(data.data, function (index, values) {
                            var Store_ID = emptyStr(values.Store_ID) ? "" : values.Store_ID.trim(),
                                Store_Name = emptyStr(values.Store_Name) ? "" : values.Store_Name.trim();
                            ddlValue = ddlValue + '<li>' +
                                '<label>' +
                                '<input value="' + Store_ID + '" type="checkbox" class="itmcheck" name="allStore" checked> ' + Store_Name +
                                '</label>' +
                                '</li>';
                        });
                        $('.dropdown-menu.allStore').append(ddlValue);
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
                FuncCheckbox("allStore");
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetAllSite() {
        try {
            $.ajax({
                url: rootUrl + "Inventory/InvHistory/GetDataSites",
                type: "GET",
                //async: false,
                dataType: "json",
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (data) {
                    if (data.success) {
                        var ddlValue = '<li>' +
                            '<label>' +
                            '<input type="checkbox" id="checkall" name="allSite" checked> All sites' +
                            '</label>' +
                            '<hr style="height: 0.1px; border-width: 0; color: gray; background-color: gray; margin: 0px 0px 8px 0px" />' +
                            '</li>';
                        $.each(data.data, function (index, values) {
                            var Site_ID = emptyStr(values.Site_ID) ? "" : values.Site_ID.trim(),
                                Site_Name = emptyStr(values.Site_Name) ? "" : values.Site_Name.trim();
                            ddlValue = ddlValue + '<li>' +
                                '<label>' +
                                '<input value="' + Site_ID + '" type="checkbox" class="itmcheck" name="allSite" checked> ' + Site_Name +
                                '</label>' +
                                '</li>';
                        });
                        $('.dropdown-menu.allSite').append(ddlValue);
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
                FuncCheckbox("allSite");
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetAllEmployee() {
        try {
            $.ajax({
                url: rootUrl + "Inventory/InvHistory/GetEmployee",
                type: "GET",
                //async: false,
                dataType: "json",
                beforeSend: function () {
                    $("#loading").show();
                },
                complete: function () {
                    $("#loading").hide();
                },
                success: function (data) {
                    if (data.success) {
                        var ddlValue = '<li>' +
                            '<label>' +
                            '<input type="checkbox" id="checkall" name="allEmployee" checked> All employee' +
                            '</label>' +
                            '<hr style="height: 0.1px; border-width: 0; color: gray; background-color: gray; margin: 0px 0px 8px 0px" />' +
                            '</li>';
                        $.each(data.data, function (index, values) {
                            var Employee_ID = emptyStr(values.Employee_ID) ? "" : values.Employee_ID.trim(),
                                Employee_Name = emptyStr(values.Employee_Name) ? "" : values.Employee_Name.trim();
                            ddlValue = ddlValue + '<li>' +
                                '<label>' +
                                '<input value="' + Employee_ID + '" type="checkbox" class="itmcheck" name="allEmployee" checked> ' + Employee_Name +
                                '</label>' +
                                '</li>';
                        });
                        $('.dropdown-menu.allEmployee').append(ddlValue);
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
                FuncCheckbox("allEmployee");
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function FuncCheckbox(name) {
        $('.itmcheck[name="' + name + '"]').on('click', function () {
            try {
                // If checkbox is not checked
                var name = emptyStr($(this).attr("name")) ? "" : $(this).attr("name");
                var el = $('.checkbox-menu.' + name + ' #checkall[name="' + name + '"]').get(0);
                if (!this.checked) {
                    // If "Select all" control is checked and has 'indeterminate' property
                    if (el && el.checked && ('indeterminate' in el)) {
                        // Set visual state of "Select all" control
                        // as 'indeterminate'
                        el.indeterminate = true;
                    }
                }

                var chked = $('.checkbox-menu.' + name + ' input[type=checkbox][name="' + name + '"]:checked').length;
                var inputchk = $('.checkbox-menu.' + name + ' input[type=checkbox][name="' + name + '"]').length - 1;

                if (chked > 0 && inputchk > 0) {
                    if (chked == inputchk) { //checkall item
                        el.indeterminate = false;
                        el.checked = true;
                    }
                    else {
                        el.indeterminate = true;
                    }
                }
                else { //uncheckall item
                    el.indeterminate = false;
                    el.checked = false;
                }
            }
            catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });

        $('#checkall[name="' + name + '"]').on('click', function () {
            try {
                var name = emptyStr($(this).attr("name")) ? "" : $(this).attr("name");
                if ($(this).is(":checked")) {
                    //If the Header Row CheckBox is checked, check all Row CheckBoxes.
                    $('.checkbox-menu.' + name + ' input[type=checkbox][name="' + name + '"]').prop("checked", true);

                } else {
                    //If the Header Row CheckBox is NOT checked, uncheck all Row CheckBoxes.
                    $('.checkbox-menu.' + name + ' input[type=checkbox][name="' + name + '"]').prop("checked", false);
                }
            }
            catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });
    }

    function ClearCount() {
        $('.editInvCount').find('#DOCNUMBER').html("");
        $('.editInvCount').find('#IC_STATUS_ITEM').html("");
        $('.editInvCount').find('#IC_DATEITEM').html("");
        $('.editInvCount').find('#IC_CREATEDBY').html("");
        $('.editInvCount').find('#table_site tbody tr').empty();
        $('.editInvCount').find('#table_site tbody tr').remove();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').empty();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').remove();
    }

    function ClearTransfer() {
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

    function ClearAdjust() {
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

    function GetDataICHeader() {
        try {
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val();
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

    function GetDataICDetail() {
        try {
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val();
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
                            if (Status < 3) {
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
                            if (Status < 3) {
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
                            if (Status < 3) {
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

    function GetDataTransferHeader() {
        try {
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val().trim();
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
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val().trim();
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

    function GetDataItemsHeader() {
        try {
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val();
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
            var DOCNUMBER = emptyStr($('div#bodyDetail').find('#DOCNUMBER').val()) ? "" : $('div#bodyDetail').find('#DOCNUMBER').val()
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

    $('.editInvCount #saveasPDF').click(function () {
        try {
            $('.editInvCount').find(".dataTables_length").prop("style", "display:none;");
            $('.editInvCount').find(".dataTables_filter").hide();
            $('.editInvCount').find(".dataTables_info").hide();
            $('.editInvCount').find(".dataTables_paginate").hide();
            $('.editInvCount').find('#pdfBodyIC').prop("style", "letter-spacing: 0.05px;");
            let srcwidth = document.getElementById('pdfBodyIC').scrollWidth;
            var pdf = new jsPDF('p', 'pt', 'a4');
            var currDate = moment(new Date()).format($('#dafor').val() + " hh:mm:ss");
            pdf.html(document.getElementById('pdfBodyIC'), {
                html2canvas: {
                    scale: 600 / srcwidth
                    //600 is the width of a4 page. 'a4': [595.28, 841.89]
                },
                callback: function () {
                    pdf.save('Inventory Counts ' + currDate + '.pdf');
                }
            });
            $('.editInvCount').find(".dataTables_length").show();
            $('.editInvCount').find(".dataTables_filter").show();
            $('.editInvCount').find(".dataTables_info").show();
            $('.editInvCount').find(".dataTables_paginate").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.editStockAdj #saveasPDF').click(function () {
        try {
            $('.editStockAdj').find(".dataTables_length").prop("style", "display:none;");
            $('.editStockAdj').find(".dataTables_filter").hide();
            $('.editStockAdj').find(".dataTables_info").hide();
            $('.editStockAdj').find(".dataTables_paginate").hide();
            $('.editStockAdj').find('#pdfBodyAdj').prop("style", "letter-spacing: 0.05px;");
            let srcwidth = document.getElementById('pdfBodyAdj').scrollWidth;
            var pdf = new jsPDF('p', 'pt', 'a4');
            var currDate = moment(new Date()).format($('#dafor').val() + " hh:mm:ss");
            pdf.html(document.getElementById('pdfBodyAdj'), {
                html2canvas: {
                    scale: 600 / srcwidth
                    //600 is the width of a4 page. 'a4': [595.28, 841.89]
                },
                callback: function () {
                    pdf.save('Stock Adjustment ' + currDate + '.pdf');
                }
            });
            $('.editStockAdj').find(".dataTables_length").show();
            $('.editStockAdj').find(".dataTables_filter").show();
            $('.editStockAdj').find(".dataTables_info").show();
            $('.editStockAdj').find(".dataTables_paginate").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.editTfItem #saveasPDF').click(function () {
        try {
            $('.editTfItem').find(".dataTables_length").prop("style", "display:none;");
            $('.editTfItem').find(".dataTables_filter").hide();
            $('.editTfItem').find(".dataTables_info").hide();
            $('.editTfItem').find(".dataTables_paginate").hide();
            $('.editTfItem').find('#pdfBodyTF').prop("style", "letter-spacing: 0.05px;");
            let srcwidth = document.getElementById('pdfBodyTF').scrollWidth;
            var pdf = new jsPDF('p', 'pt', 'a4');
            var currDate = moment(new Date()).format($('#dafor').val() + " hh:mm:ss");
            pdf.html(document.getElementById('pdfBodyTF'), {
                html2canvas: {
                    scale: 600 / srcwidth
                    //600 is the width of a4 page. 'a4': [595.28, 841.89]
                },
                callback: function () {
                    pdf.save('Transfer Item ' + currDate + '.pdf');
                }
            });
            $('.editTfItem').find(".dataTables_length").show();
            $('.editTfItem').find(".dataTables_filter").show();
            $('.editTfItem').find(".dataTables_info").show();
            $('.editTfItem').find(".dataTables_paginate").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    $('#reportrange').daterangepicker(
        {
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment().subtract(29, 'days'),
            endDate: moment()
        },
        function (start, end) {
            var filterDate = start.format($("#dafor").val()) + ' - ' + end.format($("#dafor").val());
            if (start.format("YYYY-MM-DD") <= "1900-01-01") {
                filterDate = "All";
            }
            $('#reportrange span').html(filterDate);
            GetData();
        }
    );

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

    $('#table_invhistory tbody').on("click", 'td.HISTNUMBER', function () {
        try {
            var currow = $(this).closest('tr');
            var DOCNUMBER = emptyStr(currow.find('td .docnumber').text()) ? "" : currow.find('td .docnumber').text().trim();
            DOCNUMBER = DOCNUMBER.substr(1);
            var Reason = emptyStr(currow.find('td .reason').text()) ? "" : currow.find('td .reason').text().trim();
            $('div.editStockAdj').hide();
            $('div.editTfItem').hide();
            $('div.editInvCount').hide();
            if (!emptyStr(DOCNUMBER)) {
                $('div#bodyList').hide();
                $('div#bodyDetail').show();
                $('div#bodyDetail').find('#DOCNUMBER').val(DOCNUMBER);
                if (Reason.toLowerCase() == "transfer") {
                    $('div.editTfItem').show();
                    ClearTransfer();
                    GetDataTransferHeader();
                } else if (Reason.toLowerCase() == "counted") {
                    $('div.editInvCount').show();
                    ClearCount();
                    GetDataICHeader();
                } else if (Reason.toLowerCase() == "sale") {

                } else if (Reason.toLowerCase() == "refund") {

                } else if (Reason.toLowerCase() == "receive items" || Reason.toLowerCase() == "inventory count" || Reason.toLowerCase() == "damage" || Reason.toLowerCase() == "loss") {
                    $('.editStockAdj').show();
                    ClearAdjust();
                    GetDataItemsHeader();
                }
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.btnBack').on('click', function () {
        try {
            Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //var placeHolder = '<span><i class="fas fa-store-alt pr-2"></i>All stores</span>';
    //$("#stores").select2({
    //    dropdownParent: $("#stores").parent(),
    //    placeholder: placeHolder,
    //    multiple: false,
    //    allowClear: true,
    //    width: "100%",
    //    escapeMarkup: function (m) {
    //        return m;
    //    }
    //});

});