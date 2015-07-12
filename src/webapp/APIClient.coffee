## Older Browser Support (Internet Explorer)
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
  # Returns a JSON object given a valid REST URI.
  get: (uri, success) ->
    return null if @XMLHttpRequest == 'undefined'
    url = "http://#{window.location.hostname}:3333/#{uri}"
    xhr = new XMLHttpRequest()
    xhr.addEventListener 'readystatechange', =>
      if xhr.readyState is 4 and xhr.status in [200, 304]
        success(eval '('+xhr.responseText+')')
    xhr.open 'GET', url, true
    xhr.send()

  post: (uri, data, success) ->
    return null if @XMLHttpRequest == 'undefined'
    url = "http://#{window.location.hostname}:3333/#{uri}"
    xhr = new XMLHttpRequest()
    xhr.addEventListener 'readystatechange', =>
      if xhr.readyState is 4 and xhr.status in [200, 304]
        success()
    xhr.open 'POST', url, true
    xhr.setRequestHeader 'Content-Type', 'application/json'
    payload = JSON.stringify(data)
    xhr.send() 

module.exports = APIClient
