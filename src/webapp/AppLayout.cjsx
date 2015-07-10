Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
AppHeader = require './AppHeader'

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div id="app">
      <AppHeader/>
      <main>
        <RouteHandler/>
      </main>
      <footer>
        <p className="copyright">Copyright &copy; 2015</p>
        <p className="registration"></p>
      </footer>
    </div>
