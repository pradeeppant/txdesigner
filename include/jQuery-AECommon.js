/// <reference path="jquery-1.7.2-vsdoc.js"/>


//  JS Function used to easily select ASP.NET Controls by the endPart of the ID
function SelectByID(type, endPart) {
    return element = $(type + "[id$=" + endPart + "]");
}


//  Used for loging messages to the js console
function clog(msg) {
    return; //  comment out return; to see console messages
    if (window.console && console.log) {
        console.log(msg);
    }
}


/**
* $.parseParams - parse query string paramaters into an object.
*/
(function ($) {
    var re = /([^&=]+)=?([^&]*)/g;
    var decodeRE = /\+/g;  // Regex for replacing addition symbol with a space
    var decode = function (str) { return decodeURIComponent(str.replace(decodeRE, " ")); };
    $.parseParams = function (query) {
        var params = {}, e;
        while (e = re.exec(query)) {
            var k = decode(e[1]), v = decode(e[2]);
            if (k.substring(k.length - 2) === '[]') {
                k = k.substring(0, k.length - 2);
                (params[k] || (params[k] = [])).push(v);
            }
            else params[k] = v;
        }
        return params;
    };
})(jQuery);


//  JS Extension used to flash background element color
$.fn.animateHighlight = function (highlightColor, duration) {
    clog('animateHighlight() - ' + this.attr('id'));
    var highlightBg = highlightColor || "#007EA1";
    var animateMs = duration || 1000;
    var originalBg = "#ffffff";
    this
        .stop()
        .css("background-color", highlightBg)
        .animate({ backgroundColor: originalBg }, animateMs);
};


//  Used to watch a if an elements content changes.
//  http://stackoverflow.com/a/3234646/179673
jQuery.fn.contentChange = function (callback) {
    var elms = jQuery(this);
    elms.each
        (function (i) {
            var elm = jQuery(this);
            elm.data("lastContents", elm.html());
            window.watchContentChange = window.watchContentChange ? window.watchContentChange : [];
            window.watchContentChange.push({ "element": elm, "callback": callback });
        })
    return elms;
}

