$(document).ready(function () {

    clear();

    function clear() {
        try {
            $(".msg-email").hide();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    };

    function validateEmail(el) {
        var emailaddress = $(el).val();
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if (!emailReg.test(emailaddress)) {
            $(".msg-email").text('Please enter the correct email format.');
            el.val('');
            el.removeClass("x onX").val("").change();
            el.focus();
            $(".msg-email").show();
        }
        else {
            $(".msg-email").text('');
            $(".msg-email").hide();
        }
    };

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

    $("#email").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $("#btnReset").trigger('click');
        }
    });

    $("#email").focusout(function () {
        try {
            //ResetSpan();
            var element = $(this);
            validateEmail(element);
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#btnReset").click(function (e) {
        try {
            var $btn = $(this);
            e.preventDefault();

            clear();
            var IsValid = true;

            if (emptyStr($("#email").val())) {
                IsValid = false;
                $(".msg-email").show();
            }

            if (IsValid) {

                var EmailAddress = $("#email").val().trim();

                var model = {
                    'EmailAddress': EmailAddress
                };

                var form = $('#formforgotpwd');
                var token = form.find("input[name='__RequestVerificationToken']").val();
                model = JSON.stringify(model);
                var hasil = FuncEncrypt(model);

                $.ajax({
                    url: rootUrl + 'Home/ResetPassword',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        __RequestVerificationToken: token,
                        'param': hasil
                    },
                    success: function (data) {
                        if (data.message == "success") {
                            var EmailAddress = "";
                            $.each(data.list, function (value, index) {
                                EmailAddress = emptyStr(value.EmailAddress) ? "" : value.EmailAddress.trim();
                            });
                            swal({
                                type: "success",
                                title: "The password has been successfully regenerated",
                                text: "Please check your email " + EmailAddress + " for a new temporary password and change it immediately.",
                                allowEscapeKey: false,
                                allowOutsideClick: false,
                            },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        window.location = "Home/Index";
                                    }
                                });
                        }
                        else {
                            //$("#errormessage").text(data.message);
                            swal("Error", "Error : " + data.message, "error");
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
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#formforgotpwd").submit(function (e) {
        e.preventDefault();
    });

});