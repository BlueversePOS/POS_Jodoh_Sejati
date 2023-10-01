$(document).ready(function () {
    const dtValuesPT = [
        { ID: 1, PAYMENT_TYPE: 1, PAYMENT_NAME: "Card" },
        { ID: 2, PAYMENT_TYPE: 2, PAYMENT_NAME: "Cash" }
    ];
    const dtValuesPD = [
        { ID: 1, DEVICE_NAME: "POS 1", DEVICE_STATUS: 1 }
    ];
    const dtValuesTAX = [
        { ID: 1, TAXES_NAME: "PPN 10%", TAXES_OPTION: 1, TAXES_RATE: 10 }
    ];
    //dtValuesTAX.length = 0;
    const dtValuesST = [
        { SALESTYPE_ID: 1, SALESTYPE_NAME: "Walk In" },
        { SALESTYPE_ID: 2, SALESTYPE_NAME: "Online" }
    ];
    const dtValuesSTO = [
        { ID: 1, STORES_NAME: "PokeToys", STORES_ADDRESS: "" }
    ];
    const dtValuesSITE = [
        { SITE_ID: "GD001", SITE_NAME: "Gudang Display", STORES_ID: "PokeToys" }
    ];

    //#region FUNCTION

    Clear();

    function Clear() {
        $(".divSetting").hide();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetDataPayment() {
        try {
            $('#table_paymenttypes tbody').empty();
            $('#table_paymenttypes').DataTable().destroy();

            dtTable = $('#table_paymenttypes').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesPT,
                columns: [
                    {
                        data: 'ID',
                        orderable: false,
                        width: "1px",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'PAYMENT_NAME' }
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
            $('#table_paymenttypes').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataDevices() {
        try {
            $('#table_POSDevices tbody').empty();
            $('#table_POSDevices').DataTable().destroy();

            dtTable = $('#table_POSDevices').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesPD,
                columns: [
                    {
                        data: 'ID',
                        orderable: false,
                        width: "1px",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'DEVICE_NAME' },
                    {
                        data: 'DEVICE_STATUS',
                        render: function (data, type, row) {
                            var status = emptyStr(data) ? 0 : data;
                            status = status == 1 ? "Activated" : "";
                            return status;
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
                }
            });
            $('#table_POSDevices').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataTaxes() {
        try {
            $('#table_taxes tbody').empty();
            $('#table_taxes').DataTable().destroy();

            dtTable = $('#table_taxes').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesTAX,
                columns: [
                    {
                        data: 'ID',
                        orderable: false,
                        width: "1%",
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    { data: 'TAXES_NAME' },
                    {
                        data: 'TAXES_OPTION',
                        render: function (data, type, row) {
                            var status = emptyStr(data) ? 0 : data;
                            status = status == 1 ? "Yes" : "No";
                            return status;
                        }
                    },
                    {
                        data: 'TAXES_RATE',
                        render: function (data, type, row) {
                            var rate = emptyStr(data) ? 0 : data;
                            rate = rate + "%";
                            return rate;
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
                }
            });
            $('#table_taxes').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataSales() {
        try {
            $('#table_salestype tbody').empty();
            $('#table_salestype').DataTable().destroy();

            dtTable = $('#table_salestype').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesST,
                columns: [
                    {
                        data: 'SALESTYPE_NAME',
                        render: function (data, type, row) {
                            var id = emptyStr(row.SALESTYPE_ID) ? 0 : row.SALESTYPE_ID;
                            var values = emptyStr(data) ? "" : data.trim();
                            var valDT = '<input type="hidden" value="' + id + '" />' + values;
                            return valDT;
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
                }
            });
            $('#table_salestype').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataStores() {
        try {
            $('#table_stores tbody').empty();
            $('#table_stores').DataTable().destroy();

            dtTable = $('#table_stores').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesSTO,
                columns: [
                    { data: 'STORES_NAME' },
                    { data: 'STORES_ADDRESS' },
                    {
                        data: 'ID',
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
            $('#table_stores').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetDataSite() {
        try {
            $('#table_site tbody').empty();
            $('#table_site').DataTable().destroy();

            dtTable = $('#table_site').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                data: dtValuesSITE,
                columns: [
                    { data: 'SITE_ID' },
                    { data: 'SITE_NAME' },
                    { data: 'STORES_ID' }
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
            $('#table_site').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    //#endregion

    //#region EVENT

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

    $('select').on("select2:open", function () {
        try {
            $(this).parents('.form-group').addClass('focused');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('select').on("select2:close", function () {
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

    $(".divChoosen").on("click", function () {
        try {
            var nameDiv = $(this).attr("name");
            Clear();
            $(".divChoosen").removeClass("active");
            $(this).addClass("active");
            if (!emptyStr(nameDiv)) {
                $("." + nameDiv).show();
                if (nameDiv.toLowerCase() == "payment") {
                    $(".paymentList").show();
                    $(".paymentAdd").hide();
                    GetDataPayment();
                } else if (nameDiv.toLowerCase() == "posdevices") {
                    $(".POSList").show();
                    $(".POSAdd").hide();
                    GetDataDevices();
                } else if (nameDiv.toLowerCase() == "taxes") {
                    $(".taxesEmpty").show();
                    $(".taxesList").hide();
                    $(".taxesAdd").hide();
                    if (dtValuesTAX.length > 0) {
                        $(".taxesEmpty").hide();
                        $(".taxesList").show();
                        GetDataTaxes();
                    }
                } else if (nameDiv.toLowerCase() == "salestype") {
                    $(".salesList").show();
                    $(".salesAdd").hide();
                    GetDataSales();
                } else if (nameDiv.toLowerCase() == "stores") {
                    $(".storesList").show();
                    $(".storesAdd").hide();
                    GetDataStores();
                } else if (nameDiv.toLowerCase() == "site") {
                    $(".siteList").show();
                    $(".siteAdd").hide();
                    GetDataSite();
                }
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#region Payment Types
    // Show/hide child nodes when a checkbox is clicked
    $(".tree-node").change(function () {
        try {
            var isChecked = $(this).prop("checked");
            $(this).siblings("ul").find(".tree-node").prop("checked", isChecked);
            $(this).parents("li").find(".tree-node").prop("checked", isChecked);
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#btnAddPayment").on("click", function () {
        try {
            $(".paymentList").hide();
            $(".paymentAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#store-collapse").on("click", function () {
        try {
            var collapse = $(".store-collapse").is(":visible");
            $(this).addClass("fa-chevron-down");
            $(this).removeClass("fa-chevron-up");
            $(".store-collapse").show();
            if (collapse) {
                $(this).removeClass("fa-chevron-down");
                $(this).addClass("fa-chevron-up");
                $(".store-collapse").hide();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".payment").on("click", "#btnCancel", function () {
        try {
            $(".paymentList").show();
            $(".paymentAdd").hide();
            GetDataPayment();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region POS Devices

    $("#btnAddDevices").on("click", function () {
        try {
            $(".POSList").hide();
            $(".POSAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".POSdevices").on("click", "#btnCancel", function () {
        try {
            $(".POSList").show();
            $(".POSAdd").hide();
            GetDataDevices();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region POS Devices

    $("#btnAddTax, #btnAddTaxes").on("click", function () {
        try {
            $(".taxesEmpty").hide();
            $(".taxesList").hide();
            $(".taxesAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".taxes").on("click", "#btnCancel", function () {
        try {
            $(".taxesEmpty").show();
            $(".taxesList").hide();
            $(".taxesAdd").hide();
            if (dtValuesTAX.length > 0) {
                $(".taxesEmpty").hide();
                $(".taxesList").show();
                GetDataTaxes();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Sales Type

    $("#btnAddSalesType").on("click", function () {
        try {
            $(".salesList").hide();
            $(".salesAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".salestype").on("click", "#btnCancel", function () {
        try {
            $(".salesList").show();
            $(".salesAdd").hide();
            GetDataSales();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Stores

    $("#btnAddStore").on("click", function () {
        try {
            $(".storesList").hide();
            $(".storesAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".stores").on("click", "#btnCancel", function () {
        try {
            $(".storesList").show();
            $(".storesAdd").hide();
            GetDataStores();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#region Stores

    $("#btnAddSite").on("click", function () {
        try {
            $(".siteList").hide();
            $(".siteAdd").show();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $(".site").on("click", "#btnCancel", function () {
        try {
            $(".siteList").show();
            $(".siteAdd").hide();
            GetDataSite();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

    //#endregion

});