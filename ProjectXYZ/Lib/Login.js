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
            $("#email").parents("div").siblings("span").hide();
            $("#password").parents("div").siblings("span").hide();
            //$("#captcha_text").parents("div").siblings("span").hide();
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
            //el.siblings("span").show();
            $("#errormessage").text('Please enter the correct email format.');
            //swal({ type: "info", title: "Information", text: "Please enter the correct email format." });
            el.val('');
            el.removeClass("x onX").val("").change();
            el.focus();
        }
        else {
            $("#errormessage").text('');
        }
    };

    $("#email").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $("#btnLogin").trigger('click');
        }
    });

    $("#email").focusout(function () {
        try {
            ResetSpan();
            var element = $(this);
            validateEmail(element);
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#password").focusout(function () {
        try {
            ResetSpan();
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#captcha_text").focusout(function () {
        try {
            ResetSpan();
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#captcha_img").click(function () {
        try {
            this.src = rootUrl + "Home/GetCaptchaImage";
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $("#btnLogin").click(function (e) {
        try {
            var $btn = $(this);
            e.preventDefault();

            ResetSpan();
            var IsValid = true;

            //if (emptyStr($("#email").val())) {
            //    IsValid = false;
            //    $("#email").parents(".input-group").siblings(".msg-email").show();
            //}
            //if (emptyStr($("#password").val())) {
            //    IsValid = false;
            //    $("#password").parents(".input-group").siblings(".msg-password").show();
            //}
            //if (emptyStr($("#captcha_text").val())) {
            //    IsValid = false;
            //    $("#captcha_text").parents(".input-group").siblings(".msg-box").show();
            //}

            if (IsValid) {

                //var clientcaptcha = $("#captcha_text").val().trim();

                //var model = {
                //    'clientcaptcha': clientcaptcha
                //};

                var form = $('#formlogin');
                var token = form.find("input[name='__RequestVerificationToken']").val();

                $.ajax({
                    url: rootUrl + 'Home/LoginAction',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        __RequestVerificationToken: token
                    },
                    success: function (data) {
                        if (data.captcha) {
                            $("#errormessage").text(data.message);
                        }
                        else {
                            if (data.success) {
                                window.location = rootUrl + 'Dashboard/Index';
                            }
                            else {
                                $("#errormessage").text(data.message);
                            }
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

    $("#formlogin").submit(function (e) {
        e.preventDefault();
    });
});