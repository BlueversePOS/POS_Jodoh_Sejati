$(document).ready(function () {

    const dtValues = [
        { ID: "1", ACCESS_NAME: "Owner", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 1 },
        { ID: "2", ACCESS_NAME: "Administrator", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 0 },
        { ID: "3", ACCESS_NAME: "Manager", ACCESS_POS: 1, ACCESS_BACKOFFICE: 1, ACCESS_EMPLOYEES: 0 },
        { ID: "4", ACCESS_NAME: "Cashier", ACCESS_POS: 1, ACCESS_BACKOFFICE: 0, ACCESS_EMPLOYEES: 0 }
    ];

    $(".main-header").find(".title").html("Employee List");

    Clear();

    function Clear() {
        $(".listRole").show();
        $(".addRole").hide();
        GetData();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function GetData() {
        try {
            $('#table_access tbody').empty();
            $('#table_access').DataTable().destroy();

            dtTable = $('#table_access').DataTable({
                processing: true,
                retrieve: true,
                paging: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "GET",
                    url: rootUrl + 'Employees/AccessRights/GetAccessRight',
                    "datatype": "json",
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
                },
                columns: [
                    {
                        data: 'Role_ID',
                        orderable: false,
                        render: function (data, type, row) {
                            var ID = emptyStr(data) ? "" : data;
                            return '<input type="checkbox" id="cbItem" value="' + ID + '" />';
                        }
                    },
                    {
                        data: 'Role_Name',
                        className: 'no-wrap',
                        render: function (data, type, row) {
                            var values = "";
                            var dtVal = emptyStr(data) ? "" : data.trim();
                            var back = ["orange", "blue", "purple", "green"];
                            var dtColor = back[Math.floor(Math.random() * back.length)];
                            if (!emptyStr(dtVal)) {
                                values = "<div class='col-12 row'>" +
                                    "<div class='shapes bg-" + dtColor + " mr-4 text-center text-white pt-1' style='border-radius: 50%;'><i class='fas fa-user-friends'></i></div>" +
                                    "<div><label class='col-form-label p-0'>" + dtVal + "</label></div></div>";
                            }
                            return values;
                        }
                    },
                    { data: 'Access' },
                    {
                        data: 'Access_Employee',
                        className: 'text-right'
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
            $('#table_access').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function ClearValues() {
        $('#ACCESS_NAME').val("");
        $('.switch').find("input[type=checkbox]").prop("checked", false);
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

    $('select').on("select2:open", function () {
        $(this).parents('.form-group').addClass('focused');
    });

    $('select').on("select2:close", function () {
        var inputValue = $(this).val();
        if (emptyStr(inputValue)) {
            $(this).removeClass('filled');
            $(this).parents('.form-group').removeClass('focused');
        } else {
            $(this).addClass('filled');
        }
    });

    $('#btnAddRole').on("click", function () {
        try {
            $(".listRole").hide();
            $(".addRole").show();
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