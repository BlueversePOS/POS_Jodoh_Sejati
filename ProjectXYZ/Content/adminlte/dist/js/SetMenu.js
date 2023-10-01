$(document).ready(function () {
    function emptyStr(str) {
        return !str || !/[^\s]+/.test(str);
    };

    //#region ACTIVE
    $('.sidebar').find('.active').css('color', '#fff');
    $('.sidebar').find('.active').css('background-color', '#021F61');
    $('.sidebar').find('.active > a').css('filter', 'invert(100%) sepia(0%) saturate(29%) hue-rotate(101deg) brightness(105%) contrast(108%)');

    var li_pertama = $('.sidebar').find('.active').parent('ul').parent('li');
    if (!emptyStr(li_pertama.parent('ul'))) {
        li_pertama.parent('ul').parent('li').addClass('menu-open');
        li_pertama.addClass('menu-open');
    }
    else if (!emptyStr(li_pertama)) {
        li_pertama.addClass('menu-open');
    }
    //$('.sidebar').find('.active').parent('ul').parent('li').parent('ul').parent('.li').addClass('menu-open');
    

    //#endregion

    //#region NAVI
    startNavi();
    /* FUNGSI Navigation */
    function startNavi() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                function (position) {
                    //do succes handling
                    $('#LONGITUDE').val(position.coords.longitude);
                    $('#LATITUDE').val(position.coords.latitude);
                },
                function errorCallback(error) {
                    //do error handling
                },
                {
                    maximumAge: 60000, timeout: 2000, enableHighAccuracy: true
                }
            );
        }
        else {
            swal({ type: "info", title: "Information", text: "Please Turn On Your GPS" });
        }
    };
    /* FUNGSI Navigation */
    //#endregion

});