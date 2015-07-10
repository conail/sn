## Older Browser Support (Internet Explorer)
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
  read: (uri) ->
    url = process.env.API + uri
    xhr = new XMLHttpRequest()
    xhr.addEventListener 'readystatechange', ->
      if xhr.readyState is 4
        if xhr.status in [200, 304]
          data = eval '('+xhr.responseText+')'
        else
          throw new Error()
    xhr.open 'GET', uri, false
    xhr.send()

module.exports = APIClient
