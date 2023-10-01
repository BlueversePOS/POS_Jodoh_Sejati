$(document).ready(function () {

    const dtValues = [
        { ID: "1", DISCOUNT_NAME: "Best Friend", DISCOUNT_TYPE: 1, DISCOUNT_COLOR: "pink", DISCOUNT_VALUE: 20, RESTRICTED_ACCESS: 0 },
        { ID: "2", DISCOUNT_NAME: "Good Morning", DISCOUNT_TYPE: 2, DISCOUNT_COLOR: "green", DISCOUNT_VALUE: 3000, RESTRICTED_ACCESS: 0 }
    ];

    $(".main-header").find(".title").html("Discounts");
    Clear();

    function Clear() {
        $(".emptyList").show();
        $(".existsList").hide();
        $(".addDiscount").hide();
        if (dtValues.length > 0) {
            $(".emptyList").hide();
            $(".existsList").show();
        }
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function formatCurrency(curr) {
        curr = parseFloat(curr);
        curr = curr.toFixed(2, 0);
        curr = curr.replace(".", ",");
        curr = ("Rp " + curr).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return curr;
    }

    function delFormatCurrency(curr) {
        var fixed;
        fixed = curr.substr(0, 3);
        curr = curr.replace(fixed, "");
        fixed = curr.substr(curr.length - 3);
        curr = curr.replace(fixed, "");
        for (i = 1; curr.length > i * 3; i++) {
            curr = curr.replace(".", "");
        }
        return curr;
    }

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
                        data: 'DISCOUNT_NAME',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            var dtColor = emptyStr(row.DISCOUNT_COLOR) ? "" : row.DISCOUNT_COLOR.trim();
                            if (!emptyStr(dtVal)) {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes bg-" + dtColor + " mr-4 text-center text-white pt-1' style='border-radius: 50%;'><i class='fas fa-tag'></i></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label></div></div>";
                            }
                            return values;
                        }
                    },
                    {
                        data: 'DISCOUNT_VALUE',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? 0 : data;
                            if (row.DISCOUNT_TYPE == 1) {
                                values = dtVal.toString() + "%";
                            } else if (row.DISCOUNT_TYPE == 2) {
                                values = formatCurrency(dtVal);
                            }
                            return values;
                        }
                    },
                    {
                        data: 'RESTRICTED_ACCESS',
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
                }
            });
            $('#table_discount').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#DISCOUNT_NAME').val("");
        $('#rbDiscType').prop("checked", true);
        $('#DISCOUNT_VALUE').val("");
        $('#RESTRICTED_ACCESS').val("");
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

    $('#btnCancel').on("click", function () {
        try {
            Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});