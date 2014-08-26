/*global chrome: false, localStorage: false */

// from the content script, we have access to each page's actual
// localStorage that the outside world (including webdriver) can see.

var key = 'analytics';
localStorage.removeItem(key);

chrome.runtime.onMessage.addListener(function ( url ) {
    // the background script passes successfully filtered urls as the
    // entire message string.
    if (typeof(localStorage[key]) === 'undefined') {
        localStorage[key] = JSON.stringify([ url ]);
    }
    else {
        var history = JSON.parse(localStorage[key]);
        history.push(url);

        localStorage[key] = JSON.stringify(history);
    }
});
