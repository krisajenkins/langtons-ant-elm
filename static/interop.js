/* global Elm */
(function () {
    // Start the Elm App.
    var startup = function () {
        var app = Elm.App.fullscreen();
    };

    window.addEventListener('load', startup, false);
}());
