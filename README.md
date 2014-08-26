# chrome analytics logger

This extension adds a listener to all web requests, filtering for the
following analytics expressions:

* Google Analytics: `*://*.google-analytics.com/collect*`
* ComScore: `*://*.scorecardresearch.com/*`
* Omniture `*://*/b/ss/*`

Upon matching a request to one of those patterns, a message is sent to
the page to store it in localStorage in an array in the `analytics`
key.

```javascript
localStorage.analytics // [ "an", "array", "of", "analytics", "reqs" ]
```
