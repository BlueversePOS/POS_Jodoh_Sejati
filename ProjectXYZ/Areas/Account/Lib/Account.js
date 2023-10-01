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
    }

    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
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

    $('#btnSave').on("click", function () {
        try {
            //Clear();
        } catch (err) {
            swal({ type: "error", title: "Error", text: err.message });
        }
    });

});