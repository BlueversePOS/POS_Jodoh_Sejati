$(document).ready(function () {

    //const dtValues = [
    //    { ID: "1", CATEGORY_NAME: "Kopi Susu", CATEGORY_SHAPE: "circle", ITEM_COUNT: "2 items" }
    //];

    $(".main-header").find(".title").html("Categories");
    Clear();

    function Clear() {
        $(".addCategories").hide();
        $(".listCategories").show();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_categories tbody').empty();
            $('#table_categories').DataTable().destroy();

            dtTable = $('#table_categories').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'Items/Categories/GetDataCategories',
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
                        data: 'Category_ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Category_Name',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            var Category_Color = emptyStr(row.Category_Color) ? "" : row.Category_Color.trim();
                            var ITEM_COUNT = emptyStr(row.ITEM_COUNT) ? 0 : row.ITEM_COUNT;
                            ITEM_COUNT = ITEM_COUNT == 0 ? "0 item" : row.ITEM_COUNT + " items"
                            values = "<div class='col-12 row'>" +
                                "<div class='shapes mr-4 " + Category_Color + "' style='border-radius: 50%;'></div>" +
                                "<div><label class='col-form-label p-0'>" + dtVal + "</label>" +
                                "<br /><span class='col-12 p-0' style='font-size: 9pt;'>" + ITEM_COUNT + "</span></div></div>";

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
                }
            });
            $('#table_categories').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $("#Category_ID").val("");
        $("#CATEGORY_NAME").val("");
        $('.shapes').empty();
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

    function GetDetailData() {
        try {
            var Category_ID = emptyStr($('#Category_ID').val()) ? "" : $('#Category_ID').val();

            var model = {
                'Category_ID': Category_ID
            };

            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + "Categories/GetDetailCategories",
                type: "POST",
                async: false,
                dataType: "json",
                data: {
                    param: hasil
                },
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var Category_ID = emptyStr(value.Category_ID) ? "" : value.Category_ID,
                                Category_Name = emptyStr(value.Category_Name) ? "" : value.Category_Name.trim(),
                                Category_Color = emptyStr(value.Category_Color) ? "bg-default" : value.Category_Color;

                            $("#CATEGORY_NAME").val(Category_Name).parents('.form-group').addClass('focused');
                            var check = '<i class="fa fa-check pt-3"></i>';
                            if (!emptyStr(Category_Color)) {
                                $("#" + Category_Color).append(check);
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
            var Category_ID = emptyStr($('#Category_ID').val()) ? "" : $('#Category_ID').val(),
                Category_Name = emptyStr($('#CATEGORY_NAME').val()) ? "" : $('#CATEGORY_NAME').val(),
                Category_Color = $('#Category_Color').find('i.fa-check').parent('div').attr('id');
            Category_Color = emptyStr(Category_Color) ? "bg-default" : Category_Color;
            var model = {
                'Category_ID': Category_ID,
                'Category_Name': Category_Name,
                'Category_Color': Category_Color
            };

            var form = $('#FormCategories');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Categories/SaveCategories',
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
        $(this).parents('.form-group').addClass('focused');
    });

    $('input').on('blur', function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parents('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

    $('#btnAddCategories').on('click', function () {
        try {
            $(".addCategories").show();
            $(".listCategories").hide();
            ClearValues();
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

    $('#table_categories tbody').on('dblclick', 'tr', function () {
        try {
            var currow = $(this).closest('tr');
            var Category_ID = currow.find('td:eq(0) input').val();
            $(".addCategories").show();
            $(".listCategories").hide();
            ClearValues();
            $('#Category_ID').val(Category_ID);
            GetDetailData();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnCancel').on('click', function () {
        try {
            $(".addCategories").hide();
            $(".listCategories").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnSave').on("click", function (e) {
        try {
            //e.preventDefault();
            var IsValid = true;
            var Category_ID = emptyStr($('#Category_ID').val()) ? "" : $('#Category_ID').val(),
                Category_Name = emptyStr($('#CATEGORY_NAME').val()) ? "" : $('#CATEGORY_NAME').val(),
                Category_Color = $('#Category_Color').find('i.fa-check').parent('div').attr('id');

            if (emptyStr(Category_Name)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill category name" });
            }
            if (emptyStr(Category_Color)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please choose category color" });
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