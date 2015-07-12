## MSIE Support
window.addEventListener 'load', ->
  if typeof @XMLHttpRequest == 'undefined'
    console.log 'XMLHttpRequest is undefined'
    @XMLHttpRequest = ->
      try
        return new ActiveXObject 'Msxml2.XMLHTTP.6.0'
      catch
        try
          return new ActiveXObject 'Msxml2.XMLHTTP.3.0'
        catch
          try
            return new ActiveXObject 'Microsoft.XMLHTTP'
          catch
            throw new Error 'This browser does not support XMLHttpRequest.'

APIClient = ->
  host: "http://#{location.hostname}:3333/"

  request: (verb, uri, callback, json) ->
    r = new XMLHttpRequest()
    r.addEventListener 'readystatechange', (r) ->
      if r.readyState is 4 and r.status in [200, 304]
        callback eval r.responseText
    r.open verb, @host+uri, on
    if json?
      r.setRequestHeader 'Content-Type', 'application/json'
      json = JSON.stringify json
    r.send(json)
  
  get: (uri, success) ->  @request 'GET', uri, success
  post: (uri, data, success) -> @request 'POST', uri, success, data

module.exports = APIClient
