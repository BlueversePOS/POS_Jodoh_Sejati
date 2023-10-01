$.sessionTimeout({

    // custom warning title
    title: 'Your Session is About to Expire!',

    // custom warning message
    message: 'Your session is about to expire.',

    // button text
    logoutButton: 'Logout',
    keepAliveButton: 'Stay Connected',

    // keep alive url
    keepAliveUrl: '',

    // ajax options
    ajaxType: 'POST',
    ajaxData: '',

    // redirect url
    redirUrl: rootUrl + 'Home/TimeOut',

    // logout url
    logoutUrl: rootUrl + 'Home/Logout',

    // 55 minutes
    warnAfter: 1200000,
    //warnAfter: 3000,

    // 60 minutes
    redirAfter: 1300000,
    //redirAfter: 3300,

    // 5 seconds
    keepAliveInterval: 5000,
    keepAlive: true,

    // If true, this will launch the Bootstrap warning dialog / redirect (or callback functions) in a set amounts of time regardless of user activity.
    ignoreUserActivity: false,

    // callback functions
    onStart: false,
    onWarn: false,
    onRedir: false,

    // countdown options
    countdownMessage: false,
    countdownBar: false,
    countdownSmart: false

});