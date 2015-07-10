APIClient = ->
  # Returns a JSON object given a valid REST URI.
  read: (uri) ->
    xhr = new XMLHttpRequest()
    xhr.onreadystatechange = =>
      return xhr.responseText if xhr.readyState == 4
    xhr.open 'GET', url
    xhr.send null

module.exports = APIClient
