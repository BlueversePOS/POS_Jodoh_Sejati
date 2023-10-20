$(document).ready(function () {

    const dtValues = [
        { ID: "1", ITEM_NAME: "Kopi Susu", ITEM_CATEGORY: "Kopi Susu", ITEM_PRICE: "Variable", ITEM_COST: "Rp15.000", MARGIN_COST: "-", ITEM_STOCK: "99" }
    ];

    $(".main-header").find(".title").html("Item List");

    Clear();

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function Clear() {
        GetData();
        $('.items').show();
        $('.import').hide();
        $(".composite").hide();
        $(".trackstock").hide();
    }

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

    $("#FILTER_CATEGORY").select2({
        dropdownParent: $("#FILTER_CATEGORY").parent(),
        placeholder: "All items",
        multiple: false,
        allowClear: true,
        width: "100%"
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

    $("#CATEGORY").select2({
        dropdownParent: $("#CATEGORY").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $('.cbINV').on('click', function () {   
        try {
            var cbINV = $(this).attr("name");
            var cbCOMPOSITE_ITEM = $('#COMPOSITE_ITEM').is(":checked");
            var cbTRACK_STOCK = $('#TRACK_STOCK').is(":checked");
            $('.invToggle').hide();
            if (cbCOMPOSITE_ITEM) {
                $('.composite').show();
            }
            if (cbTRACK_STOCK) {
                $('.trackstock').show();
            }
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

});