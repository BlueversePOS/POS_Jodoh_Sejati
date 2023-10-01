$(document).ready(function () {

    const dtValues = [
        { INV_TRANSFERITEM: "TO1002", INV_DATE: "2023-09-19 09:27:00", INV_DATERCV: "1900-01-01 00:00:00", INV_SOURCESITE: "GD001", INV_DESTSITE: "GD002", INV_STATUS: 1 /*in transit*/, QUANTITY: 2 },
        { INV_TRANSFERITEM: "TO1001", INV_DATE: "2023-09-19 09:26:00", INV_DATERCV: "2023-09-19 00:00:00", INV_SOURCESITE: "GD001", INV_DESTSITE: "GD002", INV_STATUS: 2 /*transferred*/, QUANTITY: 2 }
    ];

    $(".main-header").find(".title").html("Transfer Item");

    Clear();

    function Clear() {
        $('.listTfItem').find("select").val(null).trigger("change");
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
            $('#table_transferitem tbody').empty();
            $('#table_transferitem').DataTable().destroy();

            dtTable = $('#table_transferitem').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValues,
                columns: [
                    { data: 'INV_TRANSFERITEM' },
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
                        data: 'INV_DATERCV',
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
                    { data: 'INV_SOURCESITE' },
                    { data: 'INV_DESTSITE' },
                    {
                        data: 'INV_STATUS',
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
            $('#table_transferitem').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearNew() {
        $('.addTfItem').find("select").val(null).trigger("change");
        $('.addTfItem').find('.datetimepicker-input').val("");
        $('.addTfItem').find('#TFNOTES').val("");
        $('.addTfItem').find('#table_additem tbody tr').empty();
        $('.addTfItem').find('#table_additem tbody tr').remove();
        $('.addTfItem').find("#sumNotes").text("0 / 500");
    }

    function ClearEdit() {
        $('.editTfItem').find('#TFITEMNMBR').html("");
        $('.editTfItem').find('#TFSTATUS_ITEM').html("");
        $('.editTfItem').find('#TFDATEITEM').html("");
        $('.editTfItem').find('#TFORDERBY').html("");
        $('.editTfItem').find('#table_additem tbody tr').empty();
        $('.editTfItem').find('#table_additem tbody tr').remove();
        $('.editTfItem').find('#table_sourcedest tbody tr').empty();
        $('.editTfItem').find('#table_sourcedest tbody tr').remove();
        $('.editTfItem').find('#table_TfItemsDetail tbody tr').empty();
        $('.editTfItem').find('#table_TfItemsDetail tbody tr').remove();
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

    $('.datetimepicker-input').datetimepicker({
        format: $('#dafor').val().toUpperCase()
        //, defaultDate: new Date()
    });

    $("#status").select2({
        dropdownParent: $("#status").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#source_site").select2({
        dropdownParent: $("#source_site").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#dest_site").select2({
        dropdownParent: $("#dest_site").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#TF_SOURCE_SITE").select2({
        dropdownParent: $("#TF_SOURCE_SITE").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

    $("#TF_DEST_SITE").select2({
        dropdownParent: $("#TF_DEST_SITE").parent(),
        placeholder: "All",
        multiple: false,
        allowClear: true,
        width: "100%"
    });

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
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#table_transferitem').on("dblclick", function () {
        try {
            $('.listTfItem').hide();
            $('.addTfItem').hide();
            $('.editTfItem').show();
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

    $('#btnReceive').on("click", function () {
        try {
            swal({
                title: "Receive Transfer Items",
                text: "Are you sure want to receive all item?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes',
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: true
            },
                function (isConfirm) {
                    if (isConfirm) {

                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('#deleteTfItem').on("click", function () {
        try {
            swal({
                title: "Delete Items",
                text: "Are you sure want to delete this transfer item?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes',
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: true
            },
                function (isConfirm) {
                    if (isConfirm) {

                    }
                });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});