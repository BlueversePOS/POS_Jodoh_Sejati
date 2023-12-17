$(document).ready(function () {

    const dtValues = [
        { INV_STOCKADJITEM: "SA1001", INV_DATE: "2023-09-19 00:00:00", INV_REASON: "Receive items", INV_STORE: "JS STORE", INV_SITE: "GD001", QUANTITY: 2 }
    ];

    $(".main-header").find(".title").html("Stock Adjusment");

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

    function GetData() {
        try {
            $('#table_stockadjustment tbody').empty();
            $('#table_stockadjustment').DataTable().destroy();

            dtTable = $('#table_stockadjustment').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    { data: 'INV_STOCKADJITEM' },
                    {
                        data: 'INV_DATE',
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
                    { data: 'INV_REASON' },
                    { data: 'INV_STORE' },
                    { data: 'INV_SITE' },
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
        $('.addStockAdj').find("select").val(null).trigger("change");
        $('.addStockAdj').find('#SA_REASON').val("");
        $('.addStockAdj').find('#SA_SITE').val("");
        $('.addStockAdj').find('#SA_NOTES').val("");
        $('.addStockAdj').find('#table_additem tbody tr').empty();
        $('.addStockAdj').find('#table_additem tbody tr').remove();
        $('.addStockAdj').find("#sumNotes").text("0 / 500");
    }

    function ClearEdit() {
        $('.editStockAdj').find('#SA_ITEMNMBR').html("");
        $('.editStockAdj').find('#SA_DATEITEM').html("");
        $('.editStockAdj').find('#SA_REASON_TXT').html("");
        $('.editStockAdj').find('#SA_ADJUSTBY').html("");
        $('.editStockAdj').find('#table_site tbody tr').empty();
        $('.editStockAdj').find('#table_site tbody tr').remove();
        $('.editStockAdj').find('#table_SAItemsDetail tbody tr').empty();
        $('.editStockAdj').find('#table_SAItemsDetail tbody tr').remove();
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

    $("#reason").select2({
        dropdownParent: $("#reason").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
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
        width: "100%"
    });

    $("#SA_REASON").select2({
        dropdownParent: $("#SA_REASON").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#SA_SITE").select2({
        dropdownParent: $("#SA_SITE").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
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
            $('.addStockAdj').show();
            $('.editStockAdj').hide();
            ClearNew();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_stockadjustment').on("dblclick", function () {
        try {
            $('.listStockAdj').hide();
            $('.addStockAdj').hide();
            $('.editStockAdj').show();
            ClearEdit();
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

});