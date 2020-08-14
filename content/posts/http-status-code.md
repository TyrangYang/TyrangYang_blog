---
title: 'Http Status Code Overview'
date: 2020-08-13T14:11:38-07:00
Categories: ['Overview']
tags: ['http']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

Reference: [https://www.restapitutorial.com/httpstatuscodes.html](https://www.restapitutorial.com/httpstatuscodes.html)

> ⭐︎ -> "Top 10" HTTP Status Code. More REST service-specific information is contained in the entry.

## 1XX Information

-   **100 _continue_** -- Client should continue
-   **101 _switching protocols_**
-   102 _processing (webDAV)_

## 2XX Success

-   **⭐︎200 _OK_** -- The request has succeeded.
    > General status code. Most common code used to indicate success.
-   **⭐︎201 _Created_** -- A new resource has been created and should return a URI.
    > Successful creation occurred (via either POST or PUT). Set the Location header to contain a link to the newly-created resource (on POST). Response body content may or may not be present.
-   **202 _Accepted_**
-   **203 _Non-Authoritative Information_**
-   **⭐︎204 _No Content_** -- The server successfully processed the request, but is not returning any content.
    > Status when wrapped responses (e.g. JSEND) are not used and nothing is in the body (e.g. DELETE).
-   **205 _Reset Content_**
-   **206 _Partial Content_**
-   207 _Multi-Status(webDAV)_
-   208 _Already Reported (WebDAV)_
-   226 _IM Used_

## 3XX Redirection

-   **300 _Multiple Choices_**
-   **301 _Moved Permanently_**
-   **302 _Found_** -- 303 + 307
-   **303 _See Other_** -- The response to the request can be found under another URI using a GET method.
-   **⭐︎304 _Not Modified_** -- The resource has not been modified since last requested. Typically, the HTTP client provides a header like the If-Modified-Since header to provide a time against which to compare and you can use previous resource.
    > Used for conditional GET calls to reduce band-width usage. If used, must set the Date, Content-Location, ETag headers to what they would have been on a regular GET call. There must be no body on the response.
-   **305 _Use Proxy_**
-   **306 _(Unused)_** -- Used in old version
-   **307 _Temporary Redirect_** -- the request should be repeated with another URI; however, future requests can still use the original URI.
-   **308 _Permanent Redirect (experimental)_**

## 4XX Client Error

-   **⭐︎400 _Bad Request_** -- The request cannot be fulfilled due to bad syntax.
    > General error when fulfilling the request would cause an invalid state. Domain validation errors, missing data, etc. are some examples.
-   **⭐︎401 _Unauthorize_** -- Similar to 403 Forbidden, but specifically for use when authentication is possible but has failed or not yet been provided.
    > Error code response for missing or invalid authentication token.
-   **402 _Payment Required_**
-   **⭐︎403 _Forbidden_** -- The server understood the request, but is refusing to fulfill it. It SHOULD describe the reason for the refusal in the entity.
    > Error code for user not authorized to perform the operation or the resource is unavailable for some reason (e.g. time constraints, etc.).
-   **⭐︎404 _Not Found_** -- The requested resource could not be found or just don't want to tell you the reason for the refusal.
    > Used when the requested resource is not found, whether it doesn't exist or if there was a 401 or 403 that, for security reasons, the service wants to mask.
-   **405 _Method Not Allowed_**
-   **406 _Not Acceptable_**
-   **407 _Proxy Authentication Required_**
-   **408 _Request Timeout_**
-   **⭐︎409 _Conflict_** -- Indicates that the request could not be processed because of conflict in the request, such as an edit conflict.(version control)

    > Whenever a resource conflict would be caused by fulfilling the request. Duplicate entries and deleting root objects when cascade-delete is not supported are a couple of examples.

-   **410 _Gone_** -- The resource requested is no longer available and will not be available again.
-   **411 _Length Required_**
-   **412 _Precondition Failed_**
-   **413 _Request Entity Too Large_**
-   **414 _Request-URI Too Long_**
-   **415 _Unsupported Media Type_**
-   **416 _Requested Range Not Satisfiable_** -- The client has asked for a portion of the file, but the server cannot supply that portion.
-   **417 _Expectation Failed_**
-   418
-   420
-   422
-   423
-   424
-   425
-   426
-   428
-   431
-   444
-   449
-   450
-   451
-   499

## 5XX Server Error

-   **⭐︎500 _Internal Server Error_** -- A generic error message, given when no more specific message is suitable.
    > The general catch-all error when the server-side throws an exception.
-   **501 _Not Implemented_** -- The server does not support the functionality
-   **502 _Bad Gateway_** -- The server was acting as a gateway or proxy and received an invalid response from the upstream server.
-   **503 _Service Unavailable_**
-   **504 _Gateway Timeout_**
-   **505 _HTTP Version Not Supported_**
-   506 Variant Also Negotiates (Experimental)
-   507 Insufficient Storage (WebDAV)
-   508 Loop Detected (WebDAV)
-   509 Bandwidth Limit Exceeded (Apache)
-   510 Not Extended
-   **511 _Network Authentication Required_** -- The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network
-   598 Network read timeout error
-   599 Network connect timeout error
