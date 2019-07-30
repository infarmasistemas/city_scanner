$(document).on('turbolinks:load', function () {
    startOrStopSpinner = function (id) {
        $('#spinner-' + id).fadeToggle('fast');
    };
});