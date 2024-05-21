$(document).ready(function () {

    //const dtValues = [
    //    { ID: "1", DISCOUNT_NAME: "Best Friend", DISCOUNT_TYPE: 1, DISCOUNT_COLOR: "pink", DISCOUNT_VALUE: 20, RESTRICTED_ACCESS: 0 },
    //    { ID: "2", DISCOUNT_NAME: "Good Morning", DISCOUNT_TYPE: 2, DISCOUNT_COLOR: "green", DISCOUNT_VALUE: 3000, RESTRICTED_ACCESS: 0 }
    //];

    $(".main-header").find(".title").html("Discounts");
    Clear();

    function Clear() {
        $(".emptyList").hide();
        $(".existsList").show();
        $(".addDiscount").hide();
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

    function kmpSearch(pattern, text) {
        if (pattern.length == 0)
            return 0; // Immediate match

        // Compute longest suffix-prefix table
        var lsp = [0]; // Base case
        for (var i = 1; i < pattern.length; i++) {
            var j = lsp[i - 1]; // Start by assuming we're extending the previous LSP
            while (j > 0 && pattern.charAt(i) != pattern.charAt(j))
                j = lsp[j - 1];
            if (pattern.charAt(i) == pattern.charAt(j))
                j++;
            lsp.push(j);
        }

        // Walk through text string
        var j = 0; // Number of chars matched in pattern
        for (var i = 0; i < text.length; i++) {
            while (j > 0 && text.charAt(i) != pattern.charAt(j))
                j = lsp[j - 1]; // Fall back in the pattern
            if (text.charAt(i) == pattern.charAt(j)) {
                j++; // Next char matched, increment position
                if (j == pattern.length)
                    return i - (j - 1);
            }
        }
        return -1; // Not found
    }

    function formatPer(curr) {
        if (kmpSearch(",", curr.toString()) != -1) {
            curr = parseFloat(curr.replace(',', '.')).toFixed(0);
        }
        else {
            curr = parseFloat(curr);
            curr = curr.toFixed(0, 0);
        }
        //curr = curr.toFixed(2, 0);
        curr = curr.replace(".", ",");
        curr = (curr + " %").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return curr;
    };

    function delFormatPer(curr) {
        var fixed = curr.slice(-2);
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
            $('#table_discount tbody').empty();
            $('#table_discount').DataTable().destroy();

            dtTable = $('#table_discount').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'Items/Discounts/GetDataDiscount',
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
                        data: 'Discount_ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Discount_Name',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            var back = ["orange", "blue", "purple", "green", "pink", "red", "yellow", "black"];
                            var dtColor = back[Math.floor(Math.random() * back.length)];
                            if (!emptyStr(dtVal)) {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes bg-" + dtColor + " mr-4 text-center text-white pt-1' style='border-radius: 50%;'><i class='fas fa-tag'></i></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label></div></div>";
                            }
                            return values;
                        }
                    },
                    {
                        data: 'TYPE',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (dtVal == 1) {
                                values = "Bills";
                            } else if (dtVal == 2) {
                                values = "Items";
                            }
                            return values;
                        }
                    },
                    {
                        data: 'Discount_Value',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (row.Discount_Type == 1) {
                                values = formatPer(dtVal);
                            } else if (row.Discount_Type == 2) {
                                values = formatCurrency(dtVal);
                            }
                            return values;
                        }
                    },
                    {
                        data: 'Restricted_Access',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            values = dtVal == 1 ? "Yes" : "No";
                            return values;
                        }
                    }
                ],
                order: [],
                dom: "<'row'<'col-12'>>" +
                    "<'row'<'col-lg-12 col-md-12 col-sm-12 col-12'tr>>" +
                    "<'row'<'col-12 col-sm-12 col-md-4 col-lg-4'i><'col-12 col-sm-12 col-md-4 col-lg-4'l><'col-12 col-sm-12 col-md-4 col-lg-4'p>>",
                language: {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    sEmptyTable: "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                },
                initComplete: function (settings, json) {
                    if ($('#table_discount tbody').find('.dataTables_empty').is(':visible')) {
                        $(".emptyList").show();
                        $(".existsList").hide();
                    }
                }
            });
            $('#table_discount').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#Discount_ID').val("");
        $('#DISCOUNT_NAME').val("");
        $('.rbDiscType').prop("checked", false);
        $('.rbType').prop("checked", false);
        $('#DISCOUNT_VALUE').val("");
        $('#RESTRICTED_ACCESS').prop("checked", false);
    }

    function GetDetailData() {
        try {
            var Discount_ID = emptyStr($('#Discount_ID').val()) ? "" : $('#Discount_ID').val();

            var model = {
                'Discount_ID': Discount_ID
            };

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + "Discounts/GetDetailDiscount",
                type: "POST",
                async: false,
                dataType: "json",
                data: {
                    param: hasil
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Discount_ID = emptyStr(value.Discount_ID) ? "" : value.Discount_ID,
                                Discount_Name = emptyStr(value.Discount_Name) ? "" : value.Discount_Name.trim(),
                                TYPE = emptyStr(value.TYPE) ? 0 : value.TYPE,
                                Discount_Type = emptyStr(value.Discount_Type) ? 0 : value.Discount_Type,
                                Discount_Value = emptyStr(value.Discount_Value) ? 0 : value.Discount_Value,
                                Restricted_Access = emptyStr(value.Restricted_Access) ? 0 : value.Restricted_Access;

                            $('#DISCOUNT_NAME').val(Discount_Name).parent('.form-group').addClass('focused');
                            $('.rbDiscType[value="' + Discount_Type + '"]').prop("checked", true);
                            $('.rbType[value="' + TYPE + '"]').prop("checked", true);
                            $('#RESTRICTED_ACCESS').prop("checked", Restricted_Access);
                            if (Discount_Type == 1) {
                                $('#DISCOUNT_VALUE').val(formatPer(Discount_Value)).parent('.form-group').addClass('focused');
                            } else if (Discount_Type == 2) {
                                $('#DISCOUNT_VALUE').val(formatCurrency(Discount_Value)).parent('.form-group').addClass('focused');
                            }
                        });
                    }
                    else {
                        swal({ type: "error", title: "Error", text: result.message });
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

    function Save() {
        try {
            var Discount_ID = emptyStr($('#Discount_ID').val()) ? "" : $('#Discount_ID').val(),
                DISCOUNT_NAME = emptyStr($('#DISCOUNT_NAME').val()) ? "" : $('#DISCOUNT_NAME').val(),
                rbDiscType = emptyStr($('.rbDiscType:checked').val()) ? 0 : $('.rbDiscType:checked').val(),
                rbType = emptyStr($('.rbType:checked').val()) ? 0 : $('.rbType:checked').val(),
                DISCOUNT_VALUE = emptyStr($('#DISCOUNT_VALUE').val()) ? "" : $('#DISCOUNT_VALUE').val(),
                RESTRICTED_ACCESS = $('#RESTRICTED_ACCESS').is(":checked") ? 1 : 0;
            if (rbDiscType == 1) {
                DISCOUNT_VALUE = delFormatPer(DISCOUNT_VALUE);
                DISCOUNT_VALUE = DISCOUNT_VALUE.replace(",", ".");
            } else if (rbDiscType == 2) {
                DISCOUNT_VALUE = delFormatCurrency(DISCOUNT_VALUE);
            }
            var model = {
                'Discount_ID': Discount_ID,
                'DISCOUNT_NAME': DISCOUNT_NAME,
                'TYPE': rbType,
                'DISCOUNT_TYPE': rbDiscType,
                'DISCOUNT_VALUE': DISCOUNT_VALUE,
                'RESTRICTED_ACCESS': RESTRICTED_ACCESS
            };

            var form = $('#FormDiscount');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Discounts/SaveDiscount',
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

    $('input').on('focus', function () {
        $(this).prop("autocomplete", "off");
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

    $("input[name='number']").on("keydown", function (e) {
        var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
        var charStr = String.fromCharCode(charCode);
        if (!validCodes.includes(charCode)) {
            if (!charStr.match(/^[0-9]+$/)) {
                e.preventDefault();
            }
        }
    });

    $("input[name='number']").on("paste", function (e) {
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

    $('.rbType').on('click', function () {
        try {
            var checked = $('.rbType').is(':checked');
            if (checked) {
                $(this).siblings("input[type=radio]").prop("checked", false);
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.rbDiscType').on('click', function () {
        try {
            var checked = $('.rbDiscType').is(':checked');
            if (checked) {
                $(this).siblings("input[type=radio]").prop("checked", false);
            }
            checked = $('.rbDiscType:checked').val();
            var values = 0;
            if (checked == 1) {
                $('#DISCOUNT_VALUE').val(formatPer(values)).parent('.form-group').addClass('focused');
            } else if (checked == 2) {
                $('#DISCOUNT_VALUE').val(formatCurrency(values)).parent('.form-group').addClass('focused');
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#DISCOUNT_VALUE').on('focusin', function () {
        try {
            var checked = $('.rbDiscType:checked').val();
            var values = $(this).val();
            if (checked == 1) {
                $(this).val(delFormatPer(values));
            } else if (checked == 2) {
                $(this).val(delFormatCurrency(values));
            } else {
                $(this).val("");
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#DISCOUNT_VALUE').on('focusout', function () {
        try {
            var checked = $('.rbDiscType:checked').val();
            var values = $(this).val();
            if (checked == 1) {
                $(this).val(formatPer(values));
            } else if (checked == 2) {
                $(this).val(formatCurrency(values));
            } else {
                $(this).val("");
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddDiscount, #btnAddDiscounts').on("click", function () {
        try {
            $(".emptyList").hide();
            $(".existsList").hide();
            $(".addDiscount").show();
            ClearValues();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_discount tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Discount_ID = currow.find('td:eq(0) input').val();
            $(".emptyList").hide();
            $(".existsList").hide();
            $(".addDiscount").show();
            ClearValues();
            $('#Discount_ID').val(Discount_ID);
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

    $('#btnSave').on("click", function (e) {
        try {
            //e.preventDefault();
            var IsValid = true;
            var DISCOUNT_NAME = emptyStr($('#DISCOUNT_NAME').val()) ? "" : $('#DISCOUNT_NAME').val(),
                rbType = emptyStr($('.rbType:checked').val()) ? 0 : $('.rbType:checked').val(),
                rbDiscType = emptyStr($('.rbDiscType:checked').val()) ? 0 : $('.rbDiscType:checked').val(),
                DISCOUNT_VALUE = emptyStr($('#DISCOUNT_VALUE').val()) ? "" : $('#DISCOUNT_VALUE').val(),
                RESTRICTED_ACCESS = emptyStr($('#RESTRICTED_ACCESS:checked').val()) ? 0 : $('#RESTRICTED_ACCESS:checked').val();

            if (emptyStr(DISCOUNT_NAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill discount name" });
            }
            if (emptyStr(rbType)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose discount" });
            }
            if (emptyStr(rbDiscType)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose discount type" });
            }
            if (emptyStr(DISCOUNT_VALUE) || DISCOUNT_VALUE == 0) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill discount value" });
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