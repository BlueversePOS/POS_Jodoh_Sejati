$(document).ready(function () {

    const dtValues = [];

    $(".main-header").find(".title").html("Account");

    Clear();

    function Clear() {
        $('#ACCOUNT_NAME').val("");
        $('#ACCOUNT_EMAIL').val("");
        $('#ACCOUNT_PASSWORD').val("");
        $('#ACCOUNT_CURRENCY').val("");
        $('#ACCOUNT_TIMEZONE').val("");
        $('select').siblings("label").hide();

        GetDataAccount();
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    }

    function validateEmail(el) {
        var emailaddress = $(el).val();
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if (!emailReg.test(emailaddress)) {
            el.val('');
            el.removeClass("x onX").val("").change();
            el.focus();
            swal({ type: "info", title: "Information", text: "Please enter the correct email format." });
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

    function GetDataAccount() {
        try {
            var hasil;

            $.ajax({
                url: rootUrl + "Account/Account/GetDataAccount",
                type: "GET",
                async: false,
                dataType: "json",
                success: function (result) {
                    if (result.success) {
                        $.each(result.data, function (index, value) {
                            var UserID = emptyStr(value.UserID) ? "" : value.UserID.trim(),
                                Business_Name = emptyStr(value.Business_Name) ? "" : value.Business_Name.trim(),
                                EmailAddress = emptyStr(value.EmailAddress) ? "" : value.EmailAddress.trim(),
                                Password = emptyStr(value.Password) ? "" : value.Password.trim(),
                                CurrencyID = emptyStr(value.CurrencyID) ? "" : value.CurrencyID.trim(),
                                Currency = emptyStr(value.Currency) ? "" : value.Currency.trim(),
                                Timezone = emptyStr(value.Timezone) ? "" : value.Timezone.trim();

                            $('#ACCOUNT_NAME').val(Business_Name).parent('.form-group').addClass('focused');
                            $('#ACCOUNT_EMAIL').val(EmailAddress).parent('.form-group').addClass('focused');
                            $('#ACCOUNT_PASSWORD').val(Password).parent('.form-group').addClass('focused');
                            $('#ACCOUNT_CURRENCY').val(Currency).trigger('change');
                            $('#ACCOUNT_CURRENCY').siblings("label").hide();
                            if (!emptyStr(Currency)) {
                                $('#ACCOUNT_CURRENCY').siblings("label").show();
                            }
                            //var newOption = $("<option selected='selected'></option>").val(Currency).text(Currency);
                            //$('#ACCOUNT_CURRENCY').append(newOption).trigger('change');
                            $('#ACCOUNT_TIMEZONE').val(Timezone).trigger('change');
                            $('#ACCOUNT_TIMEZONE').siblings("label").hide();
                            if (!emptyStr(Timezone)) {
                                $('#ACCOUNT_TIMEZONE').siblings("label").show();
                            }
                            //var newOption = $("<option selected='selected'></option>").val(Timezone).text(Timezone);
                            //$('#ACCOUNT_TIMEZONE').append(newOption).trigger('change');
                        });
                    }
                    else {
                        swal({ type: "error", title: "Error", text: result.message });
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

    function Save() {
        try {
            var ACCOUNT_NAME = emptyStr($('#ACCOUNT_NAME').val()) ? "" : $('#ACCOUNT_NAME').val(),
                ACCOUNT_EMAIL = emptyStr($('#ACCOUNT_EMAIL').val()) ? "" : $('#ACCOUNT_EMAIL').val(),
                ACCOUNT_PASSWORD = emptyStr($('#ACCOUNT_PASSWORD').val()) ? "" : $('#ACCOUNT_PASSWORD').val(),
                ACCOUNT_CURRENCY = emptyStr($('#ACCOUNT_CURRENCY').val()) ? "" : $('#ACCOUNT_CURRENCY').val(),
                ACCOUNT_TIMEZONE = emptyStr($('#ACCOUNT_TIMEZONE').val()) ? "" : $('#ACCOUNT_TIMEZONE').val();

            var model = {
                'Business_Name': ACCOUNT_NAME,
                'EmailAddress': ACCOUNT_EMAIL,
                'PASSWORD': ACCOUNT_PASSWORD,
                'Currency': ACCOUNT_CURRENCY,
                'Timezone': ACCOUNT_TIMEZONE
            };

            var form = $('#FormAccount');
            var token = form.find("input[name='__RequestVerificationToken']").val();
            model = JSON.stringify(model);
            var hasil = FuncEncrypt(model);

            $.ajax({
                url: rootUrl + 'Account/Account/SaveAccount',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    __RequestVerificationToken: token,
                    'param': hasil
                },
                success: function (result) {
                    if (result.success) {
                        Clear();
                        swal({ type: "success", title: "Success", text: "Saved successfully" });
                    } else {
                        swal("Error", "Error : " + result.message, "error");
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
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    }

    $('input').focus(function () {
        $(this).prop("autocomplete", "off");
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

    $('#ACCOUNT_TIMEZONE').select2({
        dropdownparent: $('#ACCOUNT_TIMEZONE'),
        placeholder: "Timezone",
        allowClear: true
    });

    $('#ACCOUNT_CURRENCY').select2({
        dropdownparent: $('#ACCOUNT_CURRENCY'),
        placeholder: "Currency",
        allowClear: true
    });

    $('.select2').on("change", function () {
        try {
            var valSelect = $(this).val();
            $(this).siblings("label").hide();
            if (!emptyStr(valSelect)) {
                $(this).siblings("label").show();
            }
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

    $('.select2').on("select2:open", function () {
        $(this).siblings("label").hide();
    });

    $('.select2').on("select2:close", function () {
        var inputValue = $(this).val();
        $(this).siblings("label").hide();
        if (!emptyStr(inputValue)) {
            $(this).siblings("label").show();
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

    $('#btnSave').on("click", function (e) {
        try {
            e.preventDefault();
            var IsValid = true;
            var ACCOUNT_NAME = emptyStr($('#ACCOUNT_NAME').val()) ? "" : $('#ACCOUNT_NAME').val(),
                ACCOUNT_EMAIL = emptyStr($('#ACCOUNT_EMAIL').val()) ? "" : $('#ACCOUNT_EMAIL').val(),
                ACCOUNT_PASSWORD = emptyStr($('#ACCOUNT_PASSWORD').val()) ? "" : $('#ACCOUNT_PASSWORD').val(),
                ACCOUNT_CURRENCY = emptyStr($('#ACCOUNT_CURRENCY').val()) ? "" : $('#ACCOUNT_CURRENCY').val(),
                ACCOUNT_TIMEZONE = emptyStr($('#ACCOUNT_TIMEZONE').val()) ? "" : $('#ACCOUNT_TIMEZONE').val();

            if (emptyStr(ACCOUNT_NAME)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill business name" });
            }
            if (emptyStr(ACCOUNT_EMAIL)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill email" });
            }
            if (emptyStr(ACCOUNT_PASSWORD)) {
                IsValid = false;
                swal({ type: "info", title: "Information", text: "Please fill password" });
            }

            if (IsValid) {
                swal({
                    html: true,
                    title: 'Are you sure want to save this data?',
                    text: "This proccess cannot be undone",
                    type: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                    animation: 'slide-from-top',
                    allowEscapeKey: false,
                    allowOutsideClick: false,
                },
                    function (isConfirm) {
                        if (isConfirm) {
                            Save();
                        }
                    });
            }
        }
        catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});