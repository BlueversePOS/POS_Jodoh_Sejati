$(document).ready(function () {

    clear();

    function clear() {
        try {
            ResetSpan();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    };

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    };

    function ResetSpan() {
        try {
            //login form
            $(".msg-email").hide();
            $(".msg-password").hide();
            $(".msg-Business_Name").hide();
            $(".msg-Country").hide();
            $("#errormessage").text('');
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
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

    $("#email, #password, #Business_Name").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $("#btnSignUp").trigger('click');
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

    $("#password").focusout(function () {
        try {
            var values = $(this).val();
            $(".msg-password").hide();
            if (emptyStr(values)) {
                $(".msg-password").show();
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#Business_Name").focusout(function () {
        try {
            var values = $(this).val();
            $(".msg-Business_Name").hide();
            if (emptyStr(values)) {
                $(".msg-Business_Name").show();
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#btnSignUp").click(function (e) {
        try {
            var $btn = $(this);
            e.preventDefault();

            ResetSpan();
            var IsValid = true;

            if (emptyStr($("#email").val())) {
                IsValid = false;
                $(".msg-email").show();
            }
            if (emptyStr($("#password").val())) {
                IsValid = false;
                $(".msg-password").show();
            }
            if (emptyStr($("#Business_Name").val())) {
                IsValid = false;
                $(".msg-Business_Name").show();
            }

            if (IsValid) {

                var EmailAddress = $("#email").val().trim();
                var PASSWORD = $("#password").val().trim();
                var Business_Name = $("#Business_Name").val().trim();
                var Country = $("#Country").val();

                var model = {
                    'EmailAddress': EmailAddress,
                    'PASSWORD': PASSWORD,
                    'Business_Name': Business_Name,
                    'Country': Country
                };

                var form = $('#formsignup');
                var token = form.find("input[name='__RequestVerificationToken']").val();
                model = JSON.stringify(model);
                var hasil = FuncEncrypt(model);

                $.ajax({
                    url: rootUrl + 'Home/SignUpUser',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        __RequestVerificationToken: token,
                        'param': hasil
                    },
                    success: function (data) {
                        if (data.success) {
                            var EmailAddress = "";
                            $.each(data.list, function (value, index) {
                                EmailAddress = emptyStr(value.EmailAddress) ? "" : value.EmailAddress.trim();
                            });
                            swal({
                                type: "success",
                                title: "Successfully registered",
                                text: "Your email " + EmailAddress + " has been successfully registered.",
                                allowEscapeKey: false,
                                allowOutsideClick: false
                            }, function (isConfirm) {
                                if (isConfirm) {
                                    window.location = rootUrl + 'Home/Index';
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

    $("#formsignup").submit(function (e) {
        e.preventDefault();
    });
});