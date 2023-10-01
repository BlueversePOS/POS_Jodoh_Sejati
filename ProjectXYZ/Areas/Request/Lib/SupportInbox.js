$(document).ready(function () {

    //#region VARIABLE

    var dtTable;
    var fileType = ['JPEG', 'JPG', 'PNG', 'PDF'];
    var cl = $(".ui-selectmenu-open");
    var now = moment(Date()).format('YYYY-MM-DD');
    var model = {
        'DOCNM': "",
        'SEARCH': ""
    }

    //#endregion

    GetDataList(model);

    //#region FUNCTION

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    };

    function GetDataList(model) {
        try {
            $('#data tbody').empty();
            $('#data').DataTable().destroy();

            dtTable = $('#data').DataTable({
                processing: true,
                retrieve: true,
                lengthMenu: [[10, 25, 50], [10, 25, 50]],
                responsive: true,
                searchable: true,
                ajax: {
                    type: "POST",
                    url: rootUrl + 'Request/SupportInbox/GetSupportInboxList',
                    "datatype": "json",
                    //async: false,
                    "data": { 'model': model },
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
                        "data": "DOCNM",
                        'width': '8%',
                        render: function (data, type, row) {
                            return "#" + data;
                        }
                    },
                    {
                        "data": "CREATEDDT",
                        'width': '12%',
                        render: function (data, type, row) {
                            return moment(data).format($("#dafor").val());
                        }
                    },
                    {
                        "data": "FLAG_NAME",
                        'width': '12%',
                        render: function (data, type, row) {
                            var html = '<span class="row flag"><i class="ui-icon ' + row.FLAG_ICON.trim().toLowerCase() + ' mr-1" style="width: 24px; display: block;"></i>' + data + '</span>';
                            return html;
                        }
                    },
                    {
                        "data": "CATEGORY_HELPDESC",
                        'width': '15%'
                    },
                    { "data": "SUBJECT_HELP" },
                    {
                        "data": "STATUS",
                        'width': '8%',
                        "render": function (data, typpe, row) {
                            var html = "<span style='color:#" + row.STATUSCOLOR + "; font-weight:400'>" + row.STATUSTEXT + "</span>";
                            return html;
                        }
                    },
                    {
                        "data": "DOCNM",
                        'width': '8%'
                    }
                ],
                columnDefs: [
                    {
                        'targets': 6,
                        'searchable': false,
                        'orderable': false,
                        "className": "icon_center text-center",
                        "render": function (data) {
                            var html = ""
                            html = "<button type='button' class='btn btn-sm btnview' id='btnview' value='" + data + "'></button>";

                            return html;
                        },
                    }
                ],
                order: [0, 'desc'],
                dom: '<"top wrapper left">rt<"bottom left"l><"ml-5 right">p<"clear">',
                //language: {
                //    'paginate': {
                //        'previous': '<span class="prev-icon"><<</span>',
                //        'next': '<span class="next-icon">>></span>'
                //    },
                //    sLengthMenu: "_MENU_"
                //}
                "language": {
                    search: '',
                    searchPlaceholder: 'Cari...',
                    "sEmptyTable": "No Data",
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                }
            });
            $('#data').attr('style', 'width: 100%');
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function GetDetailData(model) {
        try {
            if (!emptyStr(model)) {
                $.ajax({
                    type: "POST",
                    url: rootUrl + 'Request/SupportInbox/GetSupportInboxList',
                    dataType: 'json',
                    async: false,
                    data: { 'model': model },
                    success: function (data) {
                        var html = "";
                        $.each(data.data, function (index, value) {
                            var DOCNM = emptyStr(value.DOCNM) ? 0 : value.DOCNM,
                                VENDORID = emptyStr(value.VENDORID) ? "" : value.VENDORID.trim(),
                                EMAILADDRESS = emptyStr(value.EMAILADDRESS) ? "" : value.EMAILADDRESS.trim(),
                                PRIORITY_ID = emptyStr(value.PRIORITY_ID) ? 0 : value.PRIORITY_ID,
                                PRIORITY_DESC = emptyStr(value.PRIORITY_DESC) ? "" : value.PRIORITY_DESC.trim(),
                                FLAG_ICON = emptyStr(value.FLAG_ICON) ? "" : value.FLAG_ICON.trim(),
                                CATEGORY_HELPID = emptyStr(value.CATEGORY_HELPID) ? 0 : value.CATEGORY_HELPID,
                                CATEGORY_HELPDESC = emptyStr(value.CATEGORY_HELPDESC) ? "" : value.CATEGORY_HELPDESC.trim(),
                                SUBJECT_HELP = emptyStr(value.SUBJECT_HELP) ? "" : value.SUBJECT_HELP.trim(),
                                MESSAGE_HELP = emptyStr(value.MESSAGE_HELP) ? "" : value.MESSAGE_HELP.trim(),
                                DOCCODE = emptyStr(value.DOCCODE) ? "" : value.DOCCODE.trim(),
                                DOCFILENAME = emptyStr(value.DOCFILENAME) ? "" : value.DOCFILENAME.trim(),
                                DOCFILEPATH = emptyStr(value.DOCFILEPATH) ? "" : value.DOCFILEPATH.trim(),
                                DOCFILE = emptyStr(value.DOCFILE) ? "" : value.DOCFILE.trim(),
                                DOCFILEDATE = moment(DOCFILEDATE).format($("#dafor").val()),
                                FileContentType = value.FileContentType,
                                FileContent = value.FileContent,
                                FileSize = value.FileSize,
                                FileDate = value.FileDate,
                                STATUS = emptyStr(value.STATUS) ? 0 : value.STATUS,
                                CREATEDUSRID = emptyStr(value.CREATEDUSRID) ? "" : value.CREATEDUSRID.trim(),
                                CREATEDDT = moment(CREATEDDT).format($("#dafor").val());
                            //var html = '<span class="row"><i class="ui-icon ' + FLAG_ICON.toLowerCase() + ' mr-1" style="width: 24px; display: block;"></i>' + PRIORITY_DESC + '</span>';
                            html = '<i class="ui-icon ' + FLAG_ICON.toLowerCase() + '" style="width: 24px; display: block;"></i>' +
                                '<input type="text" class="form-control flag_desc" value="' + PRIORITY_DESC + '" disabled />';
                            $("#Modal_Req_Support #Category").val(CATEGORY_HELPDESC);
                            $("#Modal_Req_Support #Subject").val(SUBJECT_HELP);
                            $("#Modal_Req_Support #Message").val(MESSAGE_HELP);
                            $("#Modal_Req_Support #STATUS").val(STATUS);
                            if (STATUS > 1) {
                                $('#Modal_Req_Support #STATUS').find('option[value="1"]').remove();
                            }
                            if (!emptyStr(DOCFILENAME)) {
                                var blob = dataURItoBlob(FileContent);
                                var attachfile = new File([blob], DOCFILENAME, {
                                    type: FileContentType,
                                    size: FileSize,
                                    lastModified: FileDate
                                });

                                var list = new DataTransfer();
                                list.items.add(attachfile);
                                var myFileList = list.files;

                                $("#Modal_Req_Support #Attachment")[0].files = myFileList;
                                $("#Modal_Req_Support #Attachment").trigger('change');
                            }
                        });
                    },
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
                });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function GetProgressDetail() {
        try {
            var DOCNM = $("#Modal_Req_Support").find("#DOCNM").val();
            $("#progresslist").empty();
            if (!emptyStr(DOCNM)) {
                $.ajax({
                    type: "POST",
                    url: rootUrl + 'Request/SupportInbox/SupportInboxGetProgress',
                    dataType: 'json',
                    async: false,
                    data: { 'DOCNM': DOCNM },
                    success: function (data) {
                        var html = "";
                        $.each(data.data, function (index, value) {
                            var DOCNM = emptyStr(value.DOCNM) ? 0 : value.DOCNM,
                                LNITMSEQ = emptyStr(value.LNITMSEQ) ? 0 : value.LNITMSEQ,
                                VENDORID = emptyStr(value.VENDORID) ? "" : value.VENDORID.trim(),
                                EMAILADDRESS = emptyStr(value.EMAILADDRESS) ? "" : value.EMAILADDRESS.trim(),
                                STATUS_OLD = emptyStr(value.STATUS_OLD) ? 0 : value.STATUS_OLD,
                                STATUS = emptyStr(value.STATUS) ? 0 : value.STATUS,
                                EXPLANATION = emptyStr(value.EXPLANATION) ? "" : value.EXPLANATION.trim(),
                                FIRSTNAME = emptyStr(value.FIRSTNAME) ? "" : value.FIRSTNAME.trim(),
                                LASTNAME = emptyStr(value.LASTNAME) ? "" : value.LASTNAME.trim(),
                                FULLNAME = emptyStr(value.FULLNAME) ? "" : value.FULLNAME.trim(),
                                STATUSTEXTOLD = emptyStr(value.STATUSTEXTOLD) ? "" : value.STATUSTEXTOLD.trim(),
                                STATUSCOLOROLD = emptyStr(value.STATUSCOLOROLD) ? "" : value.STATUSCOLOROLD.trim(),
                                STATUSTEXT = emptyStr(value.STATUSTEXT) ? "" : value.STATUSTEXT.trim(),
                                STATUSCOLOR = emptyStr(value.STATUSCOLOR) ? "" : value.STATUSCOLOR.trim(),
                                CREATEDUSRID = emptyStr(value.CREATEDUSRID) ? "" : value.CREATEDUSRID.trim(),
                                CREATEDDT = moment(CREATEDDT).format("DD MMMM YYYY"),
                                CREATEDTIME = moment(CREATEDDT).format("hh:mm");
                            html = '<div class="row col-lg-12 col-12 p-0 mr-0 ml-0">' +
                                '<div class="col-lg-8 col-7 p-0">' +
                                '<label style="font-weight: normal;">[' + FULLNAME + '] changed ticket status from <span style="color: #' + STATUSCOLOROLD + '">' + STATUSTEXTOLD +
                                '</span> to <span style="color: #' + STATUSCOLOR + '">' + STATUSTEXT + '</span></label>' +
                                '</div>' +
                                '<div class="col-lg-4 col-5 p-0 text-right">' +
                                '<label style="font-weight: normal; opacity: 50%;">' + CREATEDDT + ', ' + CREATEDTIME + '</label>' +
                                '</div>' +
                                '<div class="col-lg-12 col-12 p-0">' +
                                '<label style="font-weight: normal; opacity: 85%;">' + EXPLANATION + '</label>' +
                                '</div>' +
                                '</div>';
                            $("#progresslist").append(html);
                        });
                    },
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
                });
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    function AddStatus() {
        $("#Modal_Req_Support #STATUS").empty();
        $("#Modal_Req_Support #STATUS")
            .append('<option value="1" style="color: #021F61">New</option>')
            .append('<option value="2" style="color: #F2994A">Open</option>')
            .append('<option value="3" style="color: #EB5757">Hold</option>')
            .append('<option value="4" style="color: #27AE60">Closed</option>');
    }

    function ClearPopup() {
        AddStatus();
        $("#Modal_Req_Support #DOCNM").val("");
        $("#Modal_Req_Support #STATUS").val("");
        $("#Modal_Req_Support #Category").val("");
        $("#Modal_Req_Support #Subject").val("");
        $("#Modal_Req_Support #Message").val("");
        $("#Modal_Req_Support #Explanation").val("");
        $("#Attachment").val("");
        $("#attachbtndelfile").trigger('click');
    }

    function dataURItoBlob(dataURI) {
        // convert base64 to raw binary data held in a string
        // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
        var byteString = atob(dataURI.split(',')[1]);

        // separate out the mime component
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

        // write the bytes of the string to an ArrayBuffer
        var ab = new ArrayBuffer(byteString.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        return new Blob([ab], { type: mimeString });
    };

    function Update() {
        try {
            var DOCNM = $("#Modal_Req_Support").find("#DOCNM").val();
            var STATUS = $("#STATUS :selected").val();
            var EXPLANATION = $("#Explanation").val();
            var VENDORID = $("#VENDORID").val();
            model = {
                'DOCNM': "",
                'SEARCH': ""
            }
            var form = new FormData();
            form.append('VENDORID', VENDORID);
            form.append('DOCNM', DOCNM);
            form.append('STATUS', STATUS);
            form.append('EXPLANATION', EXPLANATION);
            $.ajax({
                url: rootUrl + 'Request/SupportInbox/SupportInboxUpdate',
                type: 'POST',
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                data: form,
                success: function (result) {
                    if (result.success) {
                        $("#Modal_Req_Support").modal("hide");
                        GetDataList(model);
                        swal({ type: "success", title: "Success", text: "Data submit successfully" });
                    } else {
                        swal("Error", "Error : " + result.message, "error");
                    }
                },
                error: function (xhr) {
                    var doc = $.parseHTML(xhr.responseText);
                    var titleNode = doc.filter(function (node) {
                        return node.localName === "title";
                    });
                    var msg = titleNode[0].textContent;
                    swal("Error", "Error : " + msg, "error");
                }
            });
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    var hexDigits = new Array
        ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");

    //Function to convert rgb color to hex format
    function rgb2hex(rgb) {
        rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
        return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
    }

    function hex(x) {
        return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
    }

    //#endregion

    //#region EVENT

    $('#data tbody').on('click', '.btnview', function () {
        try {
            $("#Modal_Req_Support").modal("show");
            var DOCNM = $(this).val();
            model = {
                'DOCNM': DOCNM,
                'SEARCH': ""
            }
            ClearPopup();
            $("#Modal_Req_Support #DOCNM").val(DOCNM);
            $("#Modal_Req_Support").find("#title").text("Ticket #" + DOCNM);
            GetDetailData(model);
            GetProgressDetail();
            var colorText = $("#STATUS :selected").css("color");
            colorText = rgb2hex(colorText);
            $("#STATUS").attr("style", "color: " + colorText + ";");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#Modal_Req_Support").on("click", ".close, #btnCancel", function () {
        try {
            $("#Modal_Req_Support").modal("hide");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#Modal_Req_Support").on("change", "#STATUS", function () {
        try {
            var colorText = $("#STATUS :selected").css("color");
            colorText = rgb2hex(colorText);
            $("#STATUS").attr("style", "color: " + colorText + ";");
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#btnSubmit").click(function (e) {
        try {
            e.preventDefault();

            var IsValid = true;
            var EXPLANATION = $("#Explanation").val();
            var title = $("#Modal_Req_Support").find("#title").text();

            if (emptyStr(EXPLANATION)) {
                var IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill Explanation" });
            }
            if (IsValid) {
                swal({
                    html: true,
                    title: 'Are you sure want to submit [<b>' + title + '</b>] ?',
                    text: "This proccess cannot be undone",
                    type: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    closeOnConfirm: false
                    , showLoaderOnConfirm: true
                    , animation: 'slide-from-top',
                    allowEscapeKey: false,
                    allowOutsideClick: false,
                },
                    function (isConfirm) {
                        if (isConfirm) {
                            Update();
                        }
                    });
            };
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    //#endregion

});