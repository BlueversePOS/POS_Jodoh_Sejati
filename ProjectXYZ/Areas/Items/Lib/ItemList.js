$(document).ready(function () {

    const dtValues = [
        { ID: "1", ITEM_NAME: "Kopi Susu", ITEM_CATEGORY: "Kopi Susu", ITEM_PRICE: "Variable", ITEM_COST: "Rp15.000", MARGIN_COST: "-", ITEM_STOCK: "99" }
    ];

    var optOption = [
        { id: "COFFEE", text: "Coffee Level" },
        { id: "SUGAR", text: "Sugar Level" },
        { id: "ICE", text: "Ice Level" },
    ];

    var optOption2 = [];

    const optVariant = [
        { id: "More", text: "More" },
        { id: "Normal", text: "Normal" },
        { id: "Less", text: "Less" },
        { id: "No", text: "No" },
    ];
    var arrVariant = [];

    var validCodes = [8, 9, 13, 46, 37, 39, 46, 18, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];
    var fileType = ['JPEG', 'JPG', 'PNG'];

    $(".main-header").find(".title").html("Item List");

    Clear();

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function Clear() {
        GetDataItems();
        $('.items').show();
        $('.import').hide();
        $('.itemList').show();
        $('.itemAdd').hide();
        $(".composite").hide();
        $(".trackstock").hide();
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

    function GetDataItems() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val(),
                Category_ID = emptyStr($("#FILTER_CATEGORY :selected").val()) ? "" : $("#FILTER_CATEGORY :selected").val(),
                LowStock = emptyStr($("#FILTER_STOCK :selected").val()) ? "" : $("#FILTER_STOCK :selected").val();

            var model = {
                Item_Number: Item_Number,
                Category_ID: Category_ID,
                LowStock: LowStock
            }

            $('#table_items tbody').empty();
            $('#table_items').DataTable().destroy();

            dtTable = $('#table_items').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Items/ItemList/GetDataItems',
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
                        className: 'text-center',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Item_Name',
                        className: 'no-wrap'
                    },
                    { data: 'Category_Name', },
                    {
                        data: 'Item_Price',
                        className: 'text-right',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = formatCurrency(dtVal);
                            }
                            return values;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'text-right',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (!emptyStr(dtVal)) {
                                values = formatCurrency(dtVal);
                            }
                            return values;
                        }
                    },
                    {
                        data: 'Item_Cost',
                        className: 'text-right',
                        render: function (data, type, row) {
                            var values = "";
                            var Item_Cost = emptyStr(row.Item_Cost) ? 0 : row.Item_Cost;
                            var Item_Price = emptyStr(row.Item_Price) ? 0 : row.Item_Price;
                            values = Item_Price - Item_Cost;
                            return formatCurrency(values);
                        }
                    },
                    {
                        data: 'InStock',
                        className: 'text-right'
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'col-12'>>",
                    //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#table_items').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        arrVariant.length = 0;
        $('input[type="text"], input#Item_Number').val("");
        $('input[type="number"]').val(0);
        $('#SKU').val("");
        $('input[type="radio"], input[type="checkbox"]').prop("checked", false);
        $("select").val('').trigger('change');
        $('.shapes').empty();
        $('.shapes2').empty();
        $('#table_listvariant tbody').empty();
        $('.addVariant').show();
        $('.editVariant').hide();
        $("#uploadFoto").val("");
        $(".pickfoto").show();
        $(".changefoto").hide();
        $("#pathFoto").val("");
        $(".DTLIMG img").remove();
        $(".pict").addClass("text-center");
        $.each($('.form-input'), function () {
            $(this).removeClass('filled').parent('.form-group').removeClass('focused');
            if (!emptyStr($(this).val())) {
                $(this).parent('.form-group').addClass('focused');
            }
        });
        $('#CATEGORY').parent('.form-group').addClass('focused');
        $('#Tax_ID').parent('.form-group').addClass('focused');
        $('#Item_Number').trigger('focus').trigger('blur');
    }

    function AddRowListVariants() {
        $('#table_listvariant tbody').empty();
        var dtLength = 0;
        var optionName = "";
        var arrays = [];
        for (let i = 0; i < arrVariant.length; i++) {
            var Variant_Name = arrVariant[i].OPTION_VARIANT;
            arrays.push(Variant_Name);
        }
        var result = [];
        generateCombinations(arrays, 0, [], result);
        var arrResult = [];
        for (let i = 0; i < result.length; i++) {
            var variants = "";
            for (let j = 0; j < result[i].length; j++) {
                if (!emptyStr(variants)) {
                    variants = variants + " / " + result[i][j].OPTION_VARIANT;
                } else {
                    variants = result[i][j].OPTION_VARIANT;
                }
            }
            arrResult.push({
                OPTION_VARIANT: variants
            });
        }
        var PRICE = emptyStr($('#PRICE').val()) ? formatCurrency(0) : $('#PRICE').val();
        var COST = emptyStr($('#COST').val()) ? formatCurrency(0) : $('#COST').val();
        var SKU = emptyStr($('#SKU').val()) ? 0 : $('#SKU').val();
        var jumZero = 0;
        var zero = true;
        var jumSKU = SKU.length;
        for (let i = 0; i < SKU.length; i++) {
            if (SKU[i][0] != 0) {
                zero = false;
            }
            jumZero = zero ? parseInt(jumZero) + 1 : jumZero;
        }
        console.log(jumZero);
        $.each(arrResult, function (index, value) {
            var OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT.trim();

            dtLength = emptyStr(dtLength) ? 1 : parseInt(dtLength) + 1;
            var newRow = '<tr name="' + dtLength + '" class="' + index + '">' +
                '<td class="text-center"><input type="checkbox" class="CBavail" value="' + (parseInt(index) + 1) + '" /></td>' +
                '<td class="TDvariant">' + OPTION_VARIANT + '</td>' +
                '<td><input type="text" class="form-input TDprice" name="currency" value="' + PRICE + '" /></td>' +
                '<td><input type="text" class="form-input TDcost" name="currency" value="' + COST + '" /></td>' +
                '<td><input type="text" class="form-input TDinstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDlowstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDoptstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDsku" name="number" value="' + SKU + '" /></td>' +
                '<td><input type="text" class="form-input TDbarcode" /></td>' +
                '</tr>';
            $('#table_listvariant tbody').append(newRow);
            FuncListVariant(dtLength);
            SKU = parseInt(SKU) + 1;
            var len = jumZero;
            var zero = "";
            for (let i = 0; i < len; i++) {
                zero = zero + "0";
            }
            SKU = zero + SKU;
            SKU = SKU.slice(-jumSKU);
        });
        $.each(arrVariant, function (index, value) {
            var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim();
            var OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim();
            var OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT.trim();

            optionName = emptyStr(optionName) ? OPTION_NAME_TXT : optionName + " / " + OPTION_NAME_TXT;
        });
        $('#OPTIONNAME').val(optionName);
    }

    function FuncListVariant(dtLength) {
        $("#table_listvariant tbody tr[name='" + dtLength + "']").on("keydown", "input[name='currency'], input[name='number']", function (e) {
            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
            var charStr = String.fromCharCode(charCode);
            if (!validCodes.includes(charCode)) {
                if (!charStr.match(/^[0-9]+$/)) {
                    e.preventDefault();
                }
            }
        });

        $("#table_listvariant tbody tr[name='" + dtLength + "']").on("paste", "input[name='currency'], input[name='number']", function (e) {
            //if (invalidChars.includes(e.key)) {
            //    e.preventDefault();
            //}
            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
            var charStr = String.fromCharCode(charCode);
            if (!validCodes.includes(charCode)) {
                if (!charStr.match(/^[0-9]+$/)) {
                    e.preventDefault();
                }
            }
        });

        $("#table_listvariant tbody tr[name='" + dtLength + "']").on('focusin', "input[name='currency']", function () {
            try {
                var values = emptyStr($(this).val()) ? formatCurrency(0) : $(this).val();
                $(this).val(delFormatCurrency(values));
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });

        $("#table_listvariant tbody tr[name='" + dtLength + "']").on('focusout', "input[name='currency']", function () {
            try {
                var values = emptyStr($(this).val()) ? 0 : $(this).val();
                $(this).val(formatCurrency(values));
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });
    }

    function AddRow() {
        var dtLength = $('#tableVariant tbody tr').length;
        dtLength = emptyStr(dtLength) ? 1 : parseInt(dtLength) + 1;
        var newRow = '<tr name="' + dtLength + '">' +
            '<td class="border-0 w-25">' +
            '<div class="form-group my-2 focused">' +
            '<label class="form-label" for="OPTION_NAME">Option Name</label>' +
            '<select class="form-input OPTION_NAME" id="OPTION_NAME">' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td class="border-0">' +
            '<div class="form-group my-2 focused">' +
            '<label class="form-label" for="OPTION_VARIANT"></label>' +
            '<select class="form-input OPTION_VARIANT" id="OPTION_VARIANT">' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td class="text-center border-0" style="width: 1px;">' +
            '<div class="form-group my-2">' +
            '<i type="button" class="fa fa-trash-alt text-gray btnDelete" style="display: none;"></i>' +
            '<i type="button" class="fa fa-plus text-gray btnAdd"></i>' +
            '</div>' +
            '</td>' +
            '</tr>';

        $('#tableVariant tbody').append(newRow);
        FuncVariant(dtLength);
    }

    function AddRowValue(OPTION_NAME, OPTION_NAME_TXT, OPTION_VARIANT) {
        var dtLength = $('#tableVariant tbody tr').length;
        dtLength = emptyStr(dtLength) ? 1 : parseInt(dtLength) + 1;
        var newRow = '<tr name="' + dtLength + '">' +
            '<td class="border-0 w-25">' +
            '<input type="hidden" value="' + OPTION_NAME + '" />' + OPTION_NAME_TXT +
            '</td>' +
            '<td class="border-0">' +
            '<input type="hidden" value="' + OPTION_VARIANT + '" />' + OPTION_VARIANT +
            '</td>' +
            '<td class="text-center border-0" style="width: 1px;">' +
            '<div class="form-group my-2">' +
            '<i type="button" class="fa fa-trash-alt text-gray btnDelete"></i>' +
            '<i type="button" class="fa fa-plus text-gray btnAdd" style="display: none;"></i>' +
            '</div>' +
            '</td>' +
            '</tr>';

        $('#tableVariant tbody').append(newRow);
        FuncVariant(dtLength);
    }

    function FuncVariant(currow) {
        $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_NAME").select2({
            dropdownParent: $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_NAME").parent(),
            placeholder: "Add Option",
            tags: true,
            tokenSeparators: [',', ' '],
            selectOnClose: true,
            multiple: false,
            allowClear: true,
            width: "100%"
            //, data: optOption
        });

        $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_VARIANT").select2({
            dropdownParent: $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_VARIANT").parent(),
            placeholder: "Add Variants",
            tags: true,
            tokenSeparators: [',', ' '],
            selectOnClose: true,
            multiple: true,
            allowClear: true,
            width: "100%"
            //, data: optVariant
        });

        $('#tableVariant tbody tr[name="' + currow + '"]').on('change', '.OPTION_NAME', function () {
            try {
                optOption2.length = 0;
                $.each($('#tableVariant tbody tr'), function () {
                    var currow = $(this);
                    var OPTION_NAME = emptyStr(currow.find('td:eq(0)').find('.OPTION_NAME').val()) ? currow.find('td:eq(0) input').val() : currow.find('td:eq(0)').find('.OPTION_NAME').val();
                    optOption2.push({
                        id: OPTION_NAME
                    });
                });
                if (optOption2.length > 0) {
                    $.map(optOption2,
                        function (x) {
                            optOption = $.grep(optOption, function (e) {
                                var id = emptyStr(e.id) ? "" : e.id.trim();
                                if (id != x.id) {
                                    return true;
                                } else {
                                    return false;
                                }
                            });
                        });
                }
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });

        $('#tableVariant tbody tr[name="' + currow + '"]').find("select").val('').trigger('change');

        $('#tableVariant tbody tr[name="' + currow + '"]').on('click', '.btnAdd', function () {
            try {
                var currow = $(this).closest('tr');
                var OPTION_NAME = currow.find('td:eq(0)').find('.OPTION_NAME').val();
                var OPTION_NAME_TXT = currow.find('td:eq(0)').find('.OPTION_NAME :selected').text();
                var OPTION_VARIANT = currow.find('td:eq(1)').find('.OPTION_VARIANT').val();
                OPTION_VARIANT = OPTION_VARIANT.join(", ");
                if (!emptyStr(OPTION_NAME) && !emptyStr(OPTION_VARIANT)) {
                    currow.find('.btnAdd').hide();
                    currow.find('.btnDelete').show();
                    AddRow();
                    currow.find('td:eq(0)').html('<input type="hidden" value="' + OPTION_NAME + '" />' + OPTION_NAME_TXT);
                    currow.find('td:eq(1)').html('<input type="hidden" value="' + OPTION_VARIANT + '" />' + OPTION_VARIANT);
                } else {
                    swal({ type: "info", title: "Information", text: "Please fill option and variant" });
                }
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });

        $('#tableVariant tbody tr[name="' + currow + '"]').on('click', '.btnDelete', function () {
            try {
                var currow2 = $(this).closest('tr');
                var OPTION_NAME = emptyStr(currow2.find('td:eq(0)').find('.OPTION_NAME').val()) ? currow2.find('td:eq(0) input').val() : currow2.find('td:eq(0)').find('.OPTION_NAME').val();
                var OPTION_NAME_TXT = emptyStr(currow2.find('td:eq(0)').find('.OPTION_NAME :selected').text()) ? currow2.find('td:eq(0)').text() : currow2.find('td:eq(0)').find('.OPTION_NAME :selected').text();
                optOption.push({
                    id: OPTION_NAME, text: OPTION_NAME_TXT
                });
                currow2.remove();
                arrVariant.length = 0;
                $.each($('#tableVariant tbody tr'), function () {
                    var currow = $(this);
                    var OPTION_NAME = emptyStr(currow.find('td:eq(0)').find('.OPTION_NAME').val()) ? currow.find('td:eq(0) input').val() : currow.find('td:eq(0)').find('.OPTION_NAME').val();
                    var OPTION_NAME_TXT = emptyStr(currow.find('td:eq(0)').find('.OPTION_NAME :selected').text()) ? currow.find('td:eq(0)').text() : currow.find('td:eq(0)').find('.OPTION_NAME :selected').text();
                    var OPTION_VARIANT = currow.find('td:eq(1)').find('.OPTION_VARIANT').val();
                    var OPTION_VARIANT_TXT = currow.find('td:eq(1)').text();
                    arrVariant.push({
                        OPTION_NAME: OPTION_NAME,
                        OPTION_NAME_TXT: OPTION_NAME_TXT,
                        OPTION_VARIANT: emptyStr(OPTION_VARIANT) ? OPTION_VARIANT_TXT : OPTION_VARIANT,
                    });
                });
                /*
                $('#tableVariant tbody').empty();
                $.each(arrVariant, function (index, value) {
                    var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim(),
                        OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim(),
                        OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT;
                    if (index == (parseInt(arrVariant.length) - 1)) {
                        AddRow();
                        var newOption = $("<option selected='selected'></option>").val(OPTION_NAME).text(OPTION_NAME_TXT);
                        $('#tableVariant tbody tr:last').find('td:eq(0) select').append(newOption);
                        newOption = $("<option selected='selected'></option>").val(OPTION_VARIANT)
                        $('#tableVariant tbody tr:last').find('td:eq(1) select').append(OPTION_VARIANT).trigger('change');
                    } else {
                        AddRowValue(OPTION_NAME, OPTION_NAME_TXT, OPTION_VARIANT);
                    }
                });
                if (optOption2.length > 0) {
                    $.map(optOption2,
                        function (x) {
                            optOption = $.grep(optOption, function (e) {
                                var id = emptyStr(e.id) ? "" : e.id.trim();
                                if (id != x.id) {
                                    return true;
                                } else {
                                    return false;
                                }
                            });
                        });
                }*/
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });
    }

    function GetCompositeItems() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val();

                $('#table_composite tbody').empty();
                $('#table_composite').DataTable().destroy();

                dtTableC = $('#table_composite').DataTable({
                    processing: true,
                    retrieve: true,
                    paging: true,
                    lengthMenu: [[10, 25, 50], [10, 25, 50]],
                    responsive: true,
                    searchable: true,
                    ajax: {
                        type: "POST",
                        url: rootUrl + 'Items/ItemList/GetCompositeItems',
                        "datatype": "json",
                        //async: false,
                        data: { 'Item_Number': Item_Number },
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
                            className: 'no-wrap',
                            render: function (data, type, row) {
                                var values = "";
                                var dtVal = emptyStr(data) ? 0 : data;
                                var Desc = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                                var SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                                if (!emptyStr(dtVal)) {
                                    values = '<div class="row m-0">' +
                                        '<input type="hidden" id="Item_Composite" value="' + dtVal + '" />' +
                                        '<span class="w-100">' + Desc + '</span>' +
                                        '<span class="w-100">SKU ' + SKU + '</span>' +
                                        '</div>';
                                }
                                return values;
                            }
                        },
                        {
                            data: null,
                            render: function (data, type, row) {
                                var values = '<input type="text" name="number" class="form-input text-right QTY" />';
                                return values;
                            }
                        },
                        {
                            data: 'Item_Cost',
                            className: 'text-right',
                            render: function (data, type, row) {
                                var values = "";
                                var dtVal = emptyStr(data) ? 0 : data;
                                if (!emptyStr(dtVal)) {
                                    values = formatCurrency(dtVal);
                                }
                                return values;
                            }
                        }
                    ],
                    order: [],
                    dom: "<'row'<'col-12'>>" +
                        "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                        "<'row'<'col-12'>>",
                    //"<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                    language: {
                        search: '',
                        searchPlaceholder: 'Cari...',
                        sEmptyTable: "No Data",
                        processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                    },
                    initComplete: function (settings, json) {
                        $("#table_composite tbody").on("focusin", "input[name='number']", function () {
                            try {
                                $(this).prop("autocomplete", "off");
                            } catch (err) {
                                swal({ type: "error", title: "Error", text: err.message });
                            }
                        });

                        $("#table_composite tbody").on("keydown", "input[name='number']", function (e) {
                            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
                            var charStr = String.fromCharCode(charCode);
                            if (!validCodes.includes(charCode)) {
                                if (!charStr.match(/^[0-9]+$/)) {
                                    e.preventDefault();
                                }
                            }
                        });

                        $("#table_composite tbody").on("paste", "input[name='number']", function (e) {
                            //if (invalidChars.includes(e.key)) {
                            //    e.preventDefault();
                            //}
                            var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
                            var charStr = String.fromCharCode(charCode);
                            if (!validCodes.includes(charCode)) {
                                if (!charStr.match(/^[0-9]+$/)) {
                                    e.preventDefault();
                                }
                            }
                        });

                        GetDataItemComposite();
                    }
                });
                $('#table_composite').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function Save() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val(),
                ITEMNAME = emptyStr($('#NAME').val()) ? "" : $('#NAME').val(),
                CATEGORY = emptyStr($('#CATEGORY').val()) ? "" : $('#CATEGORY').val(),
                DESCRIPTION = emptyStr($('#DESCRIPTION').val()) ? "" : $('#DESCRIPTION').val(),
                FOR_SALE = $('#FOR_SALE').is(':checked') ? 1 : 0,
                SOLD_BY = emptyStr($('.rbSoldBy:checked').val()) ? 0 : $('.rbSoldBy:checked').val(),
                PRICE = emptyStr($('#PRICE').val()) ? formatCurrency(0) : $('#PRICE').val(),
                COST = emptyStr($('#COST').val()) ? formatCurrency(0) : $('#COST').val(),
                SKU = emptyStr($('#SKU').val()) ? "" : $('#SKU').val(),
                BARCODE = emptyStr($('#BARCODE').val()) ? "" : $('#BARCODE').val(),
                COMPOSITE_ITEM = $('#COMPOSITE_ITEM').is(':checked') ? 1 : 0,
                TRACK_STOCK = $('#TRACK_STOCK').is(':checked') ? 1 : 0,
                IN_STOCK = emptyStr($('#IN_STOCK').val()) ? 0 : $('#IN_STOCK').val(),
                LOW_STOCK = emptyStr($('#LOW_STOCK').val()) ? 0 : $('#LOW_STOCK').val(),
                Tax_ID = emptyStr($('#Tax_ID').val()) ? "" : $('#Tax_ID').val(),
                Representation = emptyStr($('.rbRepresen:checked').val()) ? 0 : $('.rbRepresen:checked').val(),
                Item_Image = $("#pathFoto").val(),
                colorItem = $('#colorItem').find('i.fa-check').parent('div').attr('id'),
                shapeItem = $('#shapeItem').find('i.fa-check').parent('div').attr('id');
            colorItem = emptyStr(colorItem) ? "bg-default" : colorItem;
            if (TRACK_STOCK == 0) {
                IN_STOCK = 0;
                LOW_STOCK = 0
            }

            //#region Composite Item

            var compItem = [];
            $.each($('#table_composite tbody tr'), function () {
                var Item_Number = emptyStr(Item_Number) ? "" : Item_Number;
                var Item_Composite = emptyStr($(this).find('td:eq(0) input').val()) ? "" : $(this).find('td:eq(0) input').val();
                var Item_Quantity = emptyStr($(this).find('td:eq(1) input').val()) ? 0 : $(this).find('td:eq(1) input').val();
                var Item_Cost = emptyStr($(this).find('td:eq(2)').text()) ? formatCurrency(0) : $(this).find('td:eq(2)').text().trim();
                compItem.push({
                    'Item_Number': Item_Number,
                    'Item_Quantity': Item_Quantity,
                    'Item_Cost': delFormatCurrency(Item_Cost),
                    'Item_Composite': Item_Composite
                });
            });

            //#endregion

            //#region Item Variant

            var varItem = [];
            var LineItem_Option = 0;
            var LineItem_Variant = 0;
            var Option_ID = $('#OPTIONNAME').val();
            $.each($('#table_listvariant tbody tr'), function (index, value2) {
                var checked = $(this).find('td:eq(0) input').is(':checked') ? 1 : 0;
                LineItem_Option = parseInt(index) + 1;
                var Variant_Name = emptyStr($(this).find('td:eq(1)').text()) ? "" : $(this).find('td:eq(1)').text();
                var Item_Price = emptyStr($(this).find('td:eq(2) input').val()) ? formatCurrency(0) : $(this).find('td:eq(2) input').val();
                var Item_Cost = emptyStr($(this).find('td:eq(3) input').val()) ? formatCurrency(0) : $(this).find('td:eq(3) input').val();
                var InStock = emptyStr($(this).find('td:eq(4) input').val()) ? 0 : $(this).find('td:eq(4) input').val();
                var LowStock = emptyStr($(this).find('td:eq(5) input').val()) ? 0 : $(this).find('td:eq(5) input').val();
                var OptimalStock = emptyStr($(this).find('td:eq(6) input').val()) ? 0 : $(this).find('td:eq(6) input').val();
                var Item_SKU = emptyStr($(this).find('td:eq(7) input').val()) ? "" : $(this).find('td:eq(7) input').val();
                var Item_Barcode = emptyStr($(this).find('td:eq(8) input').val()) ? "" : $(this).find('td:eq(8) input').val();
                LineItem_Variant = parseInt(LineItem_Variant) + 1;
                varItem.push({
                    'Item_Number': Item_Number,
                    'LineItem_Option': LineItem_Option,
                    'CB_Available': checked,
                    'Option_ID': Option_ID,
                    'Option_Name': Option_ID,
                    'LineItem_Variant': LineItem_Variant,
                    'Variant_Name': Variant_Name,
                    'Item_Price': delFormatCurrency(Item_Price),
                    'Item_Cost': delFormatCurrency(Item_Cost),
                    'InStock': InStock,
                    'LowStock': LowStock,
                    'OptimalStock': OptimalStock,
                    'Item_SKU': Item_SKU,
                    'Item_Barcode': Item_Barcode,
                });
            });

            //#endregion

            var model = {
                'Item_Number': Item_Number,
                'Item_Name': ITEMNAME,
                'Item_Description': DESCRIPTION,
                'UOFM': "",
                'Category_ID': CATEGORY,
                'Item_Sales': FOR_SALE,
                'Item_SoldBy': SOLD_BY,
                'Item_Price': delFormatCurrency(PRICE),
                'Item_Cost': delFormatCurrency(COST),
                'Item_SKU': SKU,
                'Item_Barcode': BARCODE,
                'Composite_Item': COMPOSITE_ITEM,
                'Track_Stock': TRACK_STOCK,
                'InStock': IN_STOCK,
                'LowStock': LOW_STOCK,
                'Tax_ID': Tax_ID,
                'Representation': Representation,
                'Item_Color': colorItem,
                'Item_Shape': shapeItem,
                'Item_Image': Item_Image,
                'CompositeItem': compItem,
                'ItemVariant': varItem
            };

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Items/ItemList/SaveItem',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        ClearValues();
                        Clear();
                        swal({ type: "success", title: "Success", text: "Saved successfully" });
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

    function GetDetailItems() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val();

            var model = {
                Item_Number: Item_Number,
                Category_ID: "",
                LowStock: 0
            }

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Items/ItemList/GetDetailItems',
                type: 'POST',
                dataType: 'json',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        /*Item_Number, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, Item_SKU, Item_Barcode, 
                        Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, Item_Shape, Item_Image*/
                        $.each(result.data, function (index, value) {
                            var Item_Number = emptyStr(value.Item_Number) ? "" : value.Item_Number.trim(),
                                Item_Name = emptyStr(value.Item_Name) ? "" : value.Item_Name.trim(),
                                Item_Description = emptyStr(value.Item_Description) ? "" : value.Item_Description.trim(),
                                UOFM = emptyStr(value.UOFM) ? "" : value.UOFM.trim(),
                                Category_ID = emptyStr(value.Category_ID) ? "" : value.Category_ID.trim(),
                                Category_Name = emptyStr(value.Category_Name) ? "" : value.Category_Name.trim(),
                                Item_Sales = emptyStr(value.Item_Sales) ? 0 : value.Item_Sales,
                                Item_SoldBy = emptyStr(value.Item_SoldBy) ? 0 : value.Item_SoldBy,
                                Item_Price = emptyStr(value.Item_Price) ? 0 : value.Item_Price,
                                Item_Cost = emptyStr(value.Item_Cost) ? 0 : value.Item_Cost,
                                Item_SKU = emptyStr(value.Item_SKU) ? "" : value.Item_SKU.trim(),
                                Item_Barcode = emptyStr(value.Item_Barcode) ? "" : value.Item_Barcode.trim(),
                                Composite_Item = emptyStr(value.Composite_Item) ? 0 : value.Composite_Item,
                                Track_Stock = emptyStr(value.Track_Stock) ? 0 : value.Track_Stock,
                                InStock = emptyStr(value.InStock) ? 0 : value.InStock,
                                LowStock = emptyStr(value.LowStock) ? 0 : value.LowStock,
                                Tax_ID = emptyStr(value.Tax_ID) ? "" : value.Tax_ID.trim(),
                                Tax_Name = emptyStr(value.Tax_Name) ? "" : value.Tax_Name.trim(),
                                Representation = emptyStr(value.Representation) ? 0 : value.Representation,
                                Item_Color = emptyStr(value.Item_Color) ? "" : value.Item_Color.trim(),
                                Item_Shape = emptyStr(value.Item_Shape) ? "" : value.Item_Shape.trim(),
                                Item_Image = emptyStr(value.Item_Image) ? "" : value.Item_Image.trim(),
                                FileContent = emptyStr(value.FileContent) ? "" : value.FileContent.trim();

                            $('#Item_Number').val(Item_Number);
                            $('#NAME').val(Item_Name);
                            $('#CATEGORY').val();
                            var newOption = $("<option selected='selected'></option>").val(Category_ID).text(Category_Name);
                            $('#CATEGORY').append(newOption).trigger('change');
                            $('#DESCRIPTION').val(Item_Description);
                            $('#FOR_SALE').prop('checked', Item_Sales);
                            $('.rbSoldBy[value=' + Item_SoldBy + ']').prop('checked', true);
                            $('#PRICE').val(formatCurrency(Item_Price));
                            $('#COST').val(formatCurrency(Item_Cost));
                            $('#SKU').val(Item_SKU);
                            $('#BARCODE').val(Item_Barcode);
                            $('#COMPOSITE_ITEM').prop('checked', Composite_Item);
                            $('#TRACK_STOCK').prop('checked', Track_Stock);
                            $('#IN_STOCK').val(InStock);
                            $('#LOW_STOCK').val(LowStock);
                            var newOption = $("<option selected='selected'></option>").val(Tax_ID).text(Tax_Name);
                            $('#Tax_ID').append(newOption).trigger('change');
                            $('.rbRepresen[value=' + Representation + ']').prop('checked', true);
                            if (!emptyStr(Item_Color)) {
                                $('#' + Item_Color).trigger('click');
                            }
                            if (!emptyStr(Item_Shape)) {
                                $('#' + Item_Shape).trigger('click');
                            }
                            if (Representation == 2) {
                                if (!emptyStr(Item_Image)) {
                                    $("#pathFoto").val(Item_Image);
                                    $(".DTLIMG").append('<img id="IMG" style="width:170px;height: 210px;" src="' + FileContent + '"></div>');
                                    $(".pickfoto").hide();
                                    $(".changefoto").show();
                                    $(".pict").removeClass("text-center");
                                }
                            }
                            $.each($('.form-input'), function () {
                                $(this).removeClass('filled').parent('.form-group').removeClass('focused');
                                if (!emptyStr($(this).val())) {
                                    $(this).parent('.form-group').addClass('focused');
                                }
                            });
                            $('#CATEGORY').parent('.form-group').addClass('focused');
                            $('#Tax_ID').parent('.form-group').addClass('focused');
                            $('#Item_Number').trigger('focus').trigger('blur');
                        });
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
            }).done(function () {
                GetDataItemVariant();
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataItemComposite() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val();

            $.ajax({
                url: rootUrl + 'Items/ItemList/GetDataItemComposite',
                type: 'POST',
                dataType: 'json',
                data: {
                    'Item_Number': Item_Number
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Item_Number = emptyStr(value.Item_Number) ? "" : value.Item_Number.trim(),
                                Item_Cost = emptyStr(value.Item_Cost) ? 0 : value.Item_Cost,
                                Item_Composite = emptyStr(value.Item_Composite) ? "" : value.Item_Composite.trim(),
                                Item_Quantity = emptyStr(value.Item_Quantity) ? 0 : value.Item_Quantity;

                            $.each($('#table_items tbody tr'), function () {
                                var Item_CompositeTBL = emptyStr($(this).find('td:eq(0) input').val()) ? "" : $(this).find('td:eq(0) input').val();
                                if (Item_Composite == Item_CompositeTBL) {
                                    $(this).find('td:eq(1) input').val(Item_Quantity);
                                }
                            });
                        });
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

    function GetDataItemVariant() {
        try {
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val();

            $.ajax({
                url: rootUrl + 'Items/ItemList/GetDataItemVariant',
                type: 'POST',
                dataType: 'json',
                data: {
                    'Item_Number': Item_Number
                },
                success: function (result) {
                    if (result.success) {
                        var arrVariant2 = [];
                        $.each(result.data, function (index, value) {
                            var Item_Number = emptyStr(value.Item_Number) ? "" : value.Item_Number.trim(),
                                Option_ID = emptyStr(value.Option_ID) ? "" : value.Option_ID.trim(),
                                Option_Name = emptyStr(value.Option_Name) ? "" : value.Option_Name.trim(),
                                Variant_Name = emptyStr(value.Variant_Name) ? "" : value.Variant_Name.trim();
                            var splitVal = Option_ID.trim().split(' / ');
                            var splitVal2 = Variant_Name.trim().split(' / ');
                            for (let i = 0; i < splitVal.length; i++) {
                                var Options = emptyStr(splitVal[i].trim()) ? "" : splitVal[i].trim();
                                var Variants = emptyStr(splitVal2[i].trim()) ? "" : splitVal2[i].trim();
                                arrVariant2.push({
                                    Idx: i,
                                    OPTION_NAME: Options,
                                    OPTION_NAME_TXT: Options,
                                    OPTION_VARIANT: Variants
                                });
                            }
                        });
                        if (arrVariant2.length > 0) {
                            $.each(arrVariant2, function (i, x) {
                                var Idx = emptyStr(x.Idx) ? 0 : x.Idx;
                                var OPTION_NAME = emptyStr(x.OPTION_NAME) ? "" : x.OPTION_NAME.trim();
                                var OPTION_NAME_TXT = emptyStr(x.OPTION_NAME_TXT) ? "" : x.OPTION_NAME_TXT.trim();
                                var OPTION_VARIANT = emptyStr(x.OPTION_VARIANT) ? "" : x.OPTION_VARIANT.trim();

                                var exists = false;
                                if (arrVariant.length > 0) {
                                    $.map(arrVariant, function (y) {
                                        var Idx2 = emptyStr(y.Idx) ? 0 : y.Idx;
                                        var OPTION_NAME2 = emptyStr(y.OPTION_NAME) ? "" : y.OPTION_NAME.trim();
                                        var OPTION_NAME_TXT2 = emptyStr(y.OPTION_NAME_TXT) ? "" : y.OPTION_NAME_TXT.trim();
                                        var OPTION_VARIANT2 = emptyStr(y.OPTION_VARIANT) ? "" : y.OPTION_VARIANT.trim();
                                        var splitVal3 = emptyStr(OPTION_VARIANT2.split(' / ')) ? OPTION_VARIANT2 : OPTION_VARIANT2.trim().split(' / ');
                                        var varEx = false;
                                        for (let i = 0; i < splitVal3.length; i++) {
                                            if (Idx == Idx2 && OPTION_VARIANT == splitVal3[i]) {
                                                varEx = true;
                                            }
                                        }
                                        if (!varEx && Idx == Idx2) {
                                            if (!emptyStr(y.OPTION_VARIANT)) {
                                                y.OPTION_VARIANT = y.OPTION_VARIANT + " / " + OPTION_VARIANT
                                            } else {
                                                y.OPTION_VARIANT = OPTION_VARIANT;
                                            }
                                        }
                                        if (Idx == Idx2) {
                                            exists = true;
                                        }
                                    });
                                }
                                if (!exists) {
                                    arrVariant.push({
                                        Idx: Idx,
                                        OPTION_NAME: OPTION_NAME,
                                        OPTION_NAME_TXT: OPTION_NAME_TXT,
                                        OPTION_VARIANT: OPTION_VARIANT
                                    });
                                }
                            });
                        }
                        for (let i = 0; i < arrVariant.length; i++) {
                            delete arrVariant[i]["Idx"];
                        }
                        //console.log(arrVariant);
                        if (result.data.length > 0) {
                            AddRowListVariants();
                            $('.addVariant').hide();
                            $('.editVariant').show();
                        }
                        $.each(result.data, function (index, value) {
                            var Item_Number = emptyStr(value.Item_Number) ? "" : value.Item_Number.trim(),
                                LineItem_Option = emptyStr(value.LineItem_Option) ? 0 : value.LineItem_Option,
                                CB_Available = emptyStr(value.CB_Available) ? 0 : value.CB_Available,
                                Option_ID = emptyStr(value.Option_ID) ? "" : value.Option_ID.trim(),
                                Option_Name = emptyStr(value.Option_Name) ? "" : value.Option_Name.trim(),
                                LineItem_Variant = emptyStr(value.LineItem_Variant) ? 0 : value.LineItem_Variant,
                                Variant_Name = emptyStr(value.Variant_Name) ? "" : value.Variant_Name.trim(),
                                Item_Price = emptyStr(value.Item_Price) ? 0 : value.Item_Price,
                                Item_Cost = emptyStr(value.Item_Cost) ? 0 : value.Item_Cost,
                                InStock = emptyStr(value.InStock) ? 0 : value.InStock,
                                LowStock = emptyStr(value.LowStock) ? 0 : value.LowStock,
                                OptimalStock = emptyStr(value.OptimalStock) ? 0 : value.OptimalStock,
                                Item_SKU = emptyStr(value.Item_SKU) ? "" : value.Item_SKU.trim(),
                                Item_Barcode = emptyStr(value.Item_Barcode) ? "" : value.Item_Barcode.trim();
                            $.each($('#table_listvariant tbody tr'), function () {
                                var optVar = $(this).find('td:eq(1)').text().trim();
                                var currow = $(this);
                                if (optVar == Variant_Name) {
                                    currow.find('td:eq(0) input').prop('checked', CB_Available);
                                    currow.find('.TDprice').val(formatCurrency(Item_Price));
                                    currow.find('.TDcost').val(formatCurrency(Item_Cost));
                                    currow.find('.TDinstock').val(InStock);
                                    currow.find('.TDlowstock').val(LowStock);
                                    currow.find('.TDoptstock').val(OptimalStock);
                                    currow.find('.TDsku').val(Item_SKU);
                                    currow.find('.TDbarcode').val(Item_Barcode);
                                }
                            });
                        });
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

    function generateCombinations(arrays, currentIndex, currentCombination, result) {
        if (currentIndex === arrays.length) {
            result.push([...currentCombination]);
            return;
        }

        var splitVal = [];
        splitVal = arrays[currentIndex].trim().split(' / ');
        for (let i = 0; i < splitVal.length; i++) {
            if (!emptyStr(splitVal[i]) && splitVal[i] != "/") {
                var variant = splitVal[i];
                currentCombination.push({ OPTION_VARIANT: variant });
                generateCombinations(arrays, currentIndex + 1, currentCombination, result);
                currentCombination.pop();
            }
        }
    }

    //#region FILE

    function UploadDoc(form) {
        try {
            var path = "";
            $.ajax({
                dataType: 'json',
                type: 'POST',
                url: rootUrl + 'Items/ItemList/UploadDoc',
                cache: false,
                contentType: false,
                processData: false,
                data: form,
                async: false,
                success: function (data) {
                    if (data.success) {
                        path = data.path;
                        if (!emptyStr(path)) {
                            $("#pathFoto").val("");
                            $(".DTLIMG img").remove();
                        }
                        $("#pathFoto").val(path);
                        $(".DTLIMG").append('<img id="IMG" style="width:170px;height: 210px;" src="data:image/png;base64,' + data.file + '"></div>');
                        $(".pickfoto").hide();
                        $(".changefoto").show();
                        $(".pict").removeClass("text-center");
                    } else {
                        swal({ type: "error", title: "Gagal upload data", text: data.message });
                    }
                },
                error: function (xhr) {
                    var doc = $.parseHTML(xhr.responseText);
                    var titleNode = doc.filter(function (node) {
                        return node.localName === "title";
                    });
                    var msg = titleNode[0].textContent;
                    swal("Error", "Error :" + msg, "error");
                }
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    $("#uploadFoto").on("change", function () {
        try {
            var isValid = false;
            var Item_Number = emptyStr($('#Item_Number').val()) ? "" : $('#Item_Number').val();
            var files = $("#uploadFoto").prop("files")[0];
            var dateNow = moment(Date()).format("YYMMDD_HHmmss");
            var form = new FormData();
            var filename = $('#uploadFoto')[0].files[0].name;
            var extension = filename.replace(/^.*\./, '');
            form.append('DOCID', "IMG");
            form.append('DOCFILE', files);
            form.append('DOCFILENAME', "IMG" + dateNow);
            if (extension.toLowerCase() == "jpg" || extension.toLowerCase() == "jpeg" || extension.toLowerCase() == "png") isValid = true;

            if (!isValid) {
                swal({ type: "info", title: "Wrong extension file", text: "Please upload with extension JPG, JPEG or PNG" });
            } else {
                UploadDoc(form);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    $("#FILTER_CATEGORY").select2({
        dropdownParent: $("#FILTER_CATEGORY").parent(),
        placeholder: "All items",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Items/ItemList/GetCategories',
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
                            var nilai = obj.Category_ID.trim();
                            var textnilai = obj.Category_Name.trim();
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

    $("#FILTER_STOCK").select2({
        dropdownParent: $("#FILTER_STOCK").parent(),
        placeholder: "All items",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#FILTER_SEARCH").on("click", function () {
        try {
            GetDataItems();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

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

    $("input[name='number'], input[type='number'], #table_composite tbody input[name='number']").on("keydown", function (e) {
        var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
        var charStr = String.fromCharCode(charCode);
        if (!validCodes.includes(charCode)) {
            if (!charStr.match(/^[0-9]+$/)) {
                e.preventDefault();
            }
        }
    });

    $("input[name='number'], input[type='number'], #table_composite tbody input[name='number']").on("paste", function (e) {
        //if (invalidChars.includes(e.key)) {
        //    e.preventDefault();
        //}
        var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
        var charStr = String.fromCharCode(charCode);
        if (!validCodes.includes(charCode)) {
            if (!charStr.match(/^[0-9]+$/)) {
                e.preventDefault();
            }
        }
    });

    $("input[name='number']").on('focusin', function () {
        try {
            var values = emptyStr($(this).val()) ? formatCurrency(0) : $(this).val();
            values = delFormatCurrency(values);
            if (delFormatCurrency(values) == 0) {
                values = "";
            }
            $(this).val(values);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("input[name='number']").on('focusout', function () {
        try {
            var values = emptyStr($(this).val()) ? 0 : $(this).val();
            $(this).val(formatCurrency(values));
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#CATEGORY").select2({
        dropdownParent: $("#CATEGORY").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Items/ItemList/GetCategories',
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
                            var nilai = obj.Category_ID.trim();
                            var textnilai = obj.Category_Name.trim();
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

    $("#Tax_ID").select2({
        dropdownParent: $("#Tax_ID").parent(),
        placeholder: "Select Tax",
        multiple: false,
        allowClear: true,
        width: "100%",
        ajax: {
            url: rootUrl + 'Items/ItemList/GetTaxes',
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
                            var nilai = obj.Tax_ID.trim();
                            var textnilai = obj.Tax_Name.trim();
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

    $('.rbSoldBy').on('click', function () {
        try {
            var checked = $('.rbSoldBy').is(':checked');
            if (checked) {
                $(this).siblings("input[type=radio]").prop("checked", false);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.cbINV').on('click', function () {   
        try {
            var cbINV = $(this).attr("name");
            var cbCOMPOSITE_ITEM = $('#COMPOSITE_ITEM').is(":checked");
            var cbTRACK_STOCK = $('#TRACK_STOCK').is(":checked");
            $('.invToggle').hide();
            if (cbCOMPOSITE_ITEM) {
                $('.composite').show();
                GetCompositeItems("");
                $('#ITEM_SEARCH').val("");
            }
            if (cbTRACK_STOCK) {
                $('.trackstock').show();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.rbRepresen').on('click', function () {
        try {
            $('.rbRepresen').prop("checked", false);
            $(this).prop("checked", true);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#ITEM_SEARCH').on('keyup', function () {
        try {
            //filtering();
            dtTableC.search($(this).val()).draw();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.shapes').on('click', function () {
        try {
            $('.shapes').empty();
            var check = '<i class="fa fa-check pt-3"></i>';
            $(this).append(check);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.shapes2').on('click', function () {
        try {
            $('.shapes2').empty();
            var check = '<i class="fa fa-check pt-3"></i>';
            $(this).append(check);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddItems').on('click', function () {
        try {
            $('.itemList').hide();
            $('.itemAdd').show();
            ClearValues();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCancel').on('click', function () {
        try {
            $('.itemList').show();
            $('.itemAdd').hide();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnImport').on('click', function () {
        try {
            $('.items').hide();
            $('.import').show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#cancelImport').on('click', function () {
        try {
            Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#addVariant').on('click', function () {
        try {
            var SKU = emptyStr($('#SKU').val()) ? "" : $('#SKU').val();
            if (emptyStr(SKU)) {
                swal({ type: "info", title: "Information", text: "Please fill SKU first" });
            } else {
                $('#modal_variant').modal('show');
                $('#tableVariant tbody').empty();
                AddRow();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#editVariant').on('click', function () {
        try {
            var SKU = emptyStr($('#SKU').val()) ? "" : $('#SKU').val();
            if (emptyStr(SKU)) {
                swal({ type: "info", title: "Information", text: "Please fill SKU first" });
            } else {
                $('#tableVariant tbody').empty();
                var arrVar = [];
                $.each(arrVariant, function (index, value) {
                    var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim(),
                        OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim(),
                        OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT;
                    OPTION_VARIANT = OPTION_VARIANT.replaceAll(" / ", ", ");
                    AddRowValue(OPTION_NAME, OPTION_NAME_TXT, OPTION_VARIANT);
                        //if (index == (parseInt(arrVariant.length) - 1)) {
                    //    AddRow();
                    //    var newOption = $("<option selected='selected'></option>").val(OPTION_NAME).text(OPTION_NAME_TXT);
                    //    $('#tableVariant tbody tr:last').find('td:eq(0) select').append(newOption);
                    //    //$('#tableVariant tbody tr:last').find('td:eq(1) select').val(OPTION_VARIANT).trigger('change');
                    //    var splitVal;
                    //    if (!emptyStr(OPTION_VARIANT)) {
                    //        splitVal = OPTION_VARIANT.trim().split(' / ');
                    //        //alert(splitVal.length);
                    //    }
                    //    for (let i = 0; i < splitVal.length; i++) {
                    //        OPTION_VARIANT = splitVal[i].trim();
                    //        var newOption = $("<option selected='selected'></option>").val(OPTION_VARIANT).text(OPTION_VARIANT);
                    //        $('#tableVariant tbody tr:last').find('td:eq(1) select').append(newOption);
                    //        //arrVar.push( OPTION_VARIANT );
                    //    }
                    //    $('#tableVariant tbody tr:last').find('td:eq(1) select').trigger('change');
                    //} else {
                    //    OPTION_VARIANT = OPTION_VARIANT.replaceAll(" / ", ", ");
                    //    AddRowValue(OPTION_NAME, OPTION_NAME_TXT, OPTION_VARIANT);
                    //}
                });
                AddRow();
                if (optOption2.length > 0) {
                    $.map(optOption2,
                        function (x) {
                            optOption = $.grep(optOption, function (e) {
                                var id = emptyStr(e.id) ? "" : e.id.trim();
                                if (id != x.id) {
                                    return true;
                                } else {
                                    return false;
                                }
                            });
                        });
                }
                $('#modal_variant').modal('show');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#modal_variant').on('click', '#btnSaveVar', function () {
        try {
            $('#modal_variant').modal('hide');
            arrVariant.length = 0;
            $.each($('#tableVariant tbody tr'), function () {
                var currow = $(this);
                var OPTION_NAME = emptyStr(currow.find('td:eq(0)').find('.OPTION_NAME').val()) ? currow.find('td:eq(0) input').val() : currow.find('td:eq(0)').find('.OPTION_NAME').val();
                var OPTION_NAME_TXT = emptyStr(currow.find('td:eq(0)').find('.OPTION_NAME :selected').text()) ? currow.find('td:eq(0)').text() : currow.find('td:eq(0)').find('.OPTION_NAME :selected').text();
                var OPTION_VARIANT = currow.find('td:eq(1)').find('.OPTION_VARIANT').val();
                var OPTION_VARIANT_TXT = currow.find('td:eq(1)').text();
                if (!emptyStr(OPTION_VARIANT)) {
                    OPTION_VARIANT = OPTION_VARIANT.join(" / ");
                }
                if (!emptyStr(OPTION_VARIANT_TXT)) {
                    OPTION_VARIANT_TXT = OPTION_VARIANT_TXT.replaceAll(", ", " / ");
                }
                if (!emptyStr(OPTION_NAME) && (!emptyStr(OPTION_VARIANT) || !emptyStr(OPTION_VARIANT_TXT))) {
                    arrVariant.push({
                        OPTION_NAME: OPTION_NAME,
                        OPTION_NAME_TXT: OPTION_NAME_TXT,
                        OPTION_VARIANT: emptyStr(OPTION_VARIANT) ? OPTION_VARIANT_TXT : OPTION_VARIANT,
                    });
                }
            });
            //console.log(arrays);
            //console.log(result);
            AddRowListVariants();
            $('.addVariant').hide();
            $('.editVariant').show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_listvariant thead').on('click', '#CBavailALL', function () {
        try {
            var checked = $(this).is(':checked');
            $('#table_listvariant tbody').find('.CBavail').prop('checked', checked);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_items tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Item_Number = currow.find('td:eq(0) input').val();
            $('.itemList').hide();
            $('.itemAdd').show();
            ClearValues();
            $('#Item_Number').val(Item_Number);
            GetDetailItems();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSave').on('click', function () {
        try {
            //e.preventDefault();
            var IsValid = true;
            var ITEMNAME = emptyStr($('#NAME').val()) ? "" : $('#NAME').val(),
                CATEGORY = emptyStr($('#CATEGORY').val()) ? "" : $('#CATEGORY').val(),
                DESCRIPTION = emptyStr($('#DESCRIPTION').val()) ? "" : $('#DESCRIPTION').val();

            if (emptyStr(DESCRIPTION)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill description" });
            }
            if (emptyStr(CATEGORY)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose category" });
            }
            if (emptyStr(ITEMNAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill item name" });
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