/*global chrome: false */

var requestListener = function ( details ) {
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs){
        chrome.tabs.sendMessage(tabs[0].id, details.url);
    });
};

var filter = { urls: [
    '*://*.google-analytics.com/collect*',
    '*://*.scorecardresearch.com/*',
    '*://*/b/ss/*'
]};

chrome.webRequest.onBeforeRequest.addListener(requestListener, filter);
