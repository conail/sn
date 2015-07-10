APIClient = ->
  # Returns a JSON object given a valid REST URI.
  read: (uri) ->
    xhr = new XMLHttpRequest()
    xhr.onreadystatechange = =>
      if xhr.readyState == 4
        return xhr.responseText if xhr.status == 200
        return null
    xhr.open 'GET', url
    xhr.send null

  _getXHR: ->
    try
      xhr = new ActiveXObject 'Msxml2.XMLHTTP'
    catch(e)
      try
        xhr = new ActiveXObject 'Microsoft.XMLHTTP'
      catch(E)
        xhr = false
    xhr = new XMLHttpRequest() if !xhr && typeof XMLHttpRequest != ' undefined'
    return xhr

module.exports = APIClient
