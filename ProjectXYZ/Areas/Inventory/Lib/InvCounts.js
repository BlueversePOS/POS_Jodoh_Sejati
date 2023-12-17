$(document).ready(function () {

    const dtValues = [
        { INV_COUNTITEM: "IC1001", INV_DATE: "2023-09-19 00:00:00", INV_DATECOMPLETED: "1900-01-01 00:00:00", INV_STORE: "PokeToys", INV_SITE: "GD001", INV_STATUS: 1 /*1 progress 2 pending 3 completed */, INV_NOTES: "Testt" }
    ];

    $(".main-header").find(".title").html("Inventory Counts");

    Clear();

    function Clear() {
        $('.listInvCount').find("select").val(null).trigger("change");
        $('.listInvCount').show();
        $('.addInvCount').hide();
        $('.editInvCount').hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_invcount tbody').empty();
            $('#table_invcount').DataTable().destroy();

            dtTable = $('#table_invcount').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    { data: 'INV_COUNTITEM' },
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
                    {
                        data: 'INV_DATECOMPLETED',
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
                    { data: 'INV_STORE' },
                    { data: 'INV_SITE' },
                    {
                        data: 'INV_STATUS',
                        render: function (data, type, row) {
                            var status = emptyStr(data) ? 0 : data;
                            if (status == 1) {
                                status = "In progress";
                            } else if (status == 2) {
                                status = "Pending";
                            } else if (status == 3) {
                                status = "Completed";
                            }
                            return status;
                        }
                    },
                    { data: 'INV_NOTES' }
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
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearNew() {
        $('.addInvCount').find("select").val(null).trigger("change");
        $('.addInvCount').find('#IC_NOTES').val("");
        $('.addInvCount').find('input.ictype').prop("checked", false);
        $('.addInvCount').find('#table_additem tbody tr').empty();
        $('.addInvCount').find('#table_additem tbody tr').remove();
        $('.addInvCount').find("#sumNotes").text("0 / 500");
    }

    function ClearEdit() {
        $('.editInvCount').find('#IC_ITEMNMBR').html("");
        $('.editInvCount').find('#IC_STATUS_ITEM').html("");
        $('.editInvCount').find('#IC_DATEITEM').html("");
        $('.editInvCount').find('#IC_CREATEDBY').html("");
        $('.editInvCount').find('#table_site tbody tr').empty();
        $('.editInvCount').find('#table_site tbody tr').remove();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').empty();
        $('.editInvCount').find('#table_ICItemsDetail tbody tr').remove();
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

    $("#status").select2({
        dropdownParent: $("#status").parent(),
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

    $("#IC_SITE").select2({
        dropdownParent: $("#IC_SITE").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#IC_NOTES").on("keyup", function () {
        try {
            var sumNotes = $(this).val().length;
            $('.addInvCount').find("#sumNotes").text(sumNotes + " / 500");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#btnAddInvCount').on("click", function () {
        try {
            $('.listInvCount').hide();
            $('.addInvCount').show();
            $('.editInvCount').hide();
            ClearNew();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_invcount').on("dblclick", function () {
        try {
            $('.listInvCount').hide();
            $('.addInvCount').hide();
            $('.editInvCount').show();
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