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

    $(".main-header").find(".title").html("Item List");

    Clear();

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function Clear() {
        GetData();
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

    function GetData() {
        try {
            $('#table_items tbody').empty();
            $('#table_items').DataTable().destroy();

            dtTable = $('#table_items').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    {
                        data: 'ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'ITEM_NAME',
                        className: 'no-wrap'
                    },
                    { data: 'ITEM_CATEGORY', },
                    {
                        data: 'ITEM_PRICE',
                        className: 'text-right'
                    },
                    {
                        data: 'ITEM_COST',
                        className: 'text-right'
                    },
                    {
                        data: 'MARGIN_COST',
                        className: 'text-right'
                    },
                    {
                        data: 'ITEM_STOCK',
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
        $('input[type="radio"], input[type="checkbox"]').prop("checked", false);
        $("select").val('').trigger('change');
        $('.shapes').empty();
        $('.shapes2').empty();
        $('#table_listvariant tbody').empty();
        $('.addVariant').show();
        $('.editVariant').hide();
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
                PPN_10 = $('#PPN_10').is(':checked') ? 1 : 0,
                Representation = emptyStr($('.rbRepresen:checked').val()) ? 0 : $('.rbRepresen:checked').val(),
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
            $.each(arrVariant, function (index, value) {
                var Item_Number = emptyStr(Item_Number) ? "" : Item_Number;
                LineItem_Option = parseInt(index) + 1;
                var Option_ID = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim();
                var Option_Name = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim();
                var LineItem_Variant = 0;
                var Variant_Name = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT.trim();

                var splitVal;
                if (!emptyStr(Variant_Name)) {
                    splitVal = Variant_Name.trim().split(' / ');
                    //alert(splitVal.length);
                }
                for (let i = 0; i < splitVal.length; i++) {
                    Variant_Name = splitVal[i].trim();
                    LineItem_Variant = parseInt(i) + 1;
                    varItem.push({
                        'Item_Number': Item_Number,
                        'LineItem_Option': LineItem_Option,
                        'CB_Available': 0,
                        'Option_ID': Option_ID,
                        'Option_Name': Option_Name,
                        'LineItem_Variant': LineItem_Variant,
                        'Variant_Name': Variant_Name,
                        'Item_Price': 0,
                        'Item_Cost': 0,
                        'InStock': 0,
                        'LowStock': 0,
                        'OptimalStock': 0,
                        'Item_SKU': "",
                        'Item_Barcode': "",
                    });
                }
            });

            $.each($('#table_listvariant tbody tr'), function (index, value) {
                var checked = $(this).find('td:eq(0) input').is(':checked');
                var LineItem_Option = emptyStr($(this).find('td:eq(0) input').val()) ? "" : $(this).find('td:eq(0) input').val();
                var Item_Price = emptyStr($(this).find('td:eq(2) input').val()) ? formatCurrency(0) : $(this).find('td:eq(2) input').val();
                var Item_Cost = emptyStr($(this).find('td:eq(3) input').val()) ? formatCurrency(0) : $(this).find('td:eq(3) input').val();
                var InStock = emptyStr($(this).find('td:eq(4) input').val()) ? 0 : $(this).find('td:eq(4) input').val();
                var LowStock = emptyStr($(this).find('td:eq(5) input').val()) ? 0 : $(this).find('td:eq(5) input').val();
                var OptimalStock = emptyStr($(this).find('td:eq(6) input').val()) ? 0 : $(this).find('td:eq(6) input').val();
                var Item_SKU = emptyStr($(this).find('td:eq(7) input').val()) ? "" : $(this).find('td:eq(7) input').val();
                var Item_Barcode = emptyStr($(this).find('td:eq(8) input').val()) ? "" : $(this).find('td:eq(8) input').val();
                $.each(varItem, function (index, value) {
                    var lineitem = emptyStr(value.LineItem_Option) ? 0 : value.LineItem_Option;
                    if (lineitem == LineItem_Option) {
                        value.CB_Available = checked;
                        value.Item_Price = delFormatCurrency(Item_Price);
                        value.Item_Cost = delFormatCurrency(Item_Cost);
                        value.InStock = InStock;
                        value.LowStock = LowStock;
                        value.OptimalStock = OptimalStock;
                        value.Item_SKU = Item_SKU;
                        value.Item_Barcode = Item_Barcode;
                    }
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
                'Tax_10': PPN_10,
                'Representation': Representation,
                'Item_Color': colorItem,
                'Item_Shape': shapeItem,
                'Item_Image': "",
                'CompositeItem': compItem,
                'ItemVariant': varItem
            };

            //console.log(JSON.stringify(model));

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);
            
            $.ajax({
                url: rootUrl + 'ItemList/SaveItem',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
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

    function AddRowListVariants() {
        $('#table_listvariant tbody').empty();
        var dtLength = 0;
        var optionName = "";
        $.each(arrVariant, function (index, value) {
            var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim();
            var OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim();
            var OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT.trim();

            dtLength = emptyStr(dtLength) ? 1 : parseInt(dtLength) + 1;
            var newRow = '<tr name="' + dtLength + '">' +
                '<td class="text-center"><input type="checkbox" class="CBavail" value="' + (parseInt(index) + 1) + '" /></td>' +
                '<td class="TDvariant">' + OPTION_VARIANT + '</td>' +
                '<td><input type="text" class="form-input TDprice" name="currency" value="' + formatCurrency(0) + '" /></td>' +
                '<td><input type="text" class="form-input TDcost" name="currency" value="' + formatCurrency(0) + '" /></td>' +
                '<td><input type="text" class="form-input TDinstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDlowstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDoptstock" name="number" /></td>' +
                '<td><input type="text" class="form-input TDsku" name="number" /></td>' +
                '<td><input type="text" class="form-input TDbarcode" /></td>' +
                '</tr>';
            $('#table_listvariant tbody').append(newRow);
            FuncListVariant(dtLength);

            optionName = emptyStr(optionName) ? OPTION_NAME_TXT : optionName + " / " + OPTION_NAME_TXT;
        });
        $('#OPTIONNAME').text("Options: " + optionName);
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
            placeholder: "Choose Option",
            multiple: false,
            allowClear: true,
            width: "100%",
            data: optOption
        });

        $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_VARIANT").select2({
            dropdownParent: $('#tableVariant tbody tr[name="' + currow + '"]').find(".OPTION_VARIANT").parent(),
            placeholder: "Choose Variants",
            multiple: true,
            allowClear: true,
            width: "100%",
            data: optVariant
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
                currow.find('.btnAdd').hide();
                currow.find('.btnDelete').show();
                AddRow();
                var OPTION_NAME = currow.find('td:eq(0)').find('.OPTION_NAME').val();
                var OPTION_NAME_TXT = currow.find('td:eq(0)').find('.OPTION_NAME :selected').text();
                var OPTION_VARIANT = currow.find('td:eq(1)').find('.OPTION_VARIANT').val();
                OPTION_VARIANT = OPTION_VARIANT.join(", ");
                currow.find('td:eq(0)').html('<input type="hidden" value="' + OPTION_NAME + '" />' + OPTION_NAME_TXT);
                currow.find('td:eq(1)').html('<input type="hidden" value="' + OPTION_VARIANT + '" />' + OPTION_VARIANT);
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
                $('#tableVariant tbody').empty();
                $.each(arrVariant, function (index, value) {
                    var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim(),
                        OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim(),
                        OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT;
                    if (index == (parseInt(arrVariant.length) - 1)) {
                        AddRow();
                        var newOption = $("<option selected='selected'></option>").val(OPTION_NAME).text(OPTION_NAME_TXT);
                        $('#tableVariant tbody tr:last').find('td:eq(0) select').append(newOption);
                        $('#tableVariant tbody tr:last').find('td:eq(1) select').val(OPTION_VARIANT).trigger('change');
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
                }
            } catch (err) {
                swal({ type: "error", title: "Error", text: err.message });
            }
        });
    }

    function GetCompositeItems() {
        try {
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
                        type: "GET",
                        url: rootUrl + 'Items/ItemList/GetCompositeItems',
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
                            data: 'Item_Number',
                            className: 'no-wrap',
                            render: function (data, type, row) {
                                var values = "";
                                var dtVal = emptyStr(data) ? 0 : data;
                                var Desc = emptyStr(row.Item_Description) ? "" : row.Item_Description.trim();
                                var SKU = emptyStr(row.Item_SKU) ? "" : row.Item_SKU.trim();
                                if (!emptyStr(dtVal)) {
                                    values = '<div class="row m-0">' +
                                        '<input type="hidden" value="' + dtVal + '" />' +
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
                    }
                });
                $('#table_composite').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

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

    $('input').focus(function () {
        try {
            $(this).prop("autocomplete", "off");
            $(this).parents('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('input').blur(function () {
        try {
            var inputValue = $(this).val();
            if (emptyStr(inputValue)) {
                $(this).removeClass('filled');
                $(this).parents('.form-group').removeClass('focused');
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
            $('#modal_variant').modal('show');
            $('#tableVariant tbody').empty();
            AddRow();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#editVariant').on('click', function () {
        try {
            $('#tableVariant tbody').empty();
            var arrVar = [];
            $.each(arrVariant, function (index, value) {
                var OPTION_NAME = emptyStr(value.OPTION_NAME) ? "" : value.OPTION_NAME.trim(),
                    OPTION_NAME_TXT = emptyStr(value.OPTION_NAME_TXT) ? "" : value.OPTION_NAME_TXT.trim(),
                    OPTION_VARIANT = emptyStr(value.OPTION_VARIANT) ? "" : value.OPTION_VARIANT;
                if (index == (parseInt(arrVariant.length) - 1)) {
                    AddRow();
                    var newOption = $("<option selected='selected'></option>").val(OPTION_NAME).text(OPTION_NAME_TXT);
                    $('#tableVariant tbody tr:last').find('td:eq(0) select').append(newOption);
                    //$('#tableVariant tbody tr:last').find('td:eq(1) select').val(OPTION_VARIANT).trigger('change');
                    var splitVal;
                    if (!emptyStr(OPTION_VARIANT)) {
                        splitVal = OPTION_VARIANT.trim().split(' / ');
                        //alert(splitVal.length);
                    }
                    for (let i = 0; i < splitVal.length; i++) {
                        OPTION_VARIANT = splitVal[i].trim();
                        arrVar.push( OPTION_VARIANT );
                    }
                    $('#tableVariant tbody tr:last').find('td:eq(1) select').val(arrVar).trigger('change');
                } else {
                    OPTION_VARIANT = OPTION_VARIANT.replaceAll(" / ", ", ");
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
            }
            $('#modal_variant').modal('show');
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
                arrVariant.push({
                    OPTION_NAME: OPTION_NAME,
                    OPTION_NAME_TXT: OPTION_NAME_TXT,
                    OPTION_VARIANT: emptyStr(OPTION_VARIANT) ? OPTION_VARIANT_TXT : OPTION_VARIANT,
                });
            });
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

    $('#btnSave').on('click', function () {
        try {
            //e.preventDefault();
            var IsValid = true;
            var ITEMNAME = emptyStr($('#NAME').val()) ? "" : $('#NAME').val(),
                CATEGORY = emptyStr($('#CATEGORY').val()) ? "" : $('#CATEGORY').val(),
                DESCRIPTION = emptyStr($('#DESCRIPTION').val()) ? "" : $('#DESCRIPTION').val();

            if (emptyStr(ITEMNAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill item name" });
            }
            if (emptyStr(CATEGORY)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose category" });
            }
            if (emptyStr(DESCRIPTION)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill category" });
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