$(document).ready(function () {

    const dtValues = [
        { ID: "1", CATEGORY_NAME: "Kopi Susu", CATEGORY_SHAPE: "circle", ITEM_COUNT: "2 items" }
    ];

    $(".main-header").find(".title").html("Categories");
    Clear();
    GetData();

    function Clear() {
        $(".addCategories").hide();
        $(".listCategories").show();
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
                        data: 'CATEGORY_NAME',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            if (!emptyStr(row.CATEGORY_SHAPE) && row.CATEGORY_SHAPE.toLowerCase() == "circle") {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes mr-4' style='border-radius: 50%;'></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label></div></div>";
                            }
                            if (!emptyStr(row.ITEM_COUNT)) {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes mr-4' style='border-radius: 50%;'></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label>" +
                                    "<br /><span class='col-12 p-0' style='font-size: 9pt;'>" + row.ITEM_COUNT + "</span></div></div>";
                            }
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
        $("#CATEGORY_NAME").val("");
    }

    $('input').focus(function () {
        $(this).parents('.form-group').addClass('focused');
    });

    $('input').blur(function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parents('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

    $('#btnAddCategories').focus(function () {
        $(".addCategories").show();
        $(".listCategories").hide();
        ClearValues();
    });

    $('#btnBack').focus(function () {
        $(".addCategories").hide();
        $(".listCategories").show();
    });

});