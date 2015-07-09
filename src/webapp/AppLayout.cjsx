Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'App'
  render: ->
    <div id="app">
      <header>
        <nav id="user">
          <a href="/logout">Logout</a>
          <a href="/login">Login</a>
        </nav>
        <nav id="primary">
          <a href="/">Home</a>
          <a href="/users">Users</a>
          <Link to="profile">Profile</Link>
          <Link to="courses">Courses</Link>
        </nav>
      </header>
      <main>
        <RouteHandler/>
      </main>
      <footer>
        <p className="copyright">Copyright &copy; 2015</p>
        <p className="registration"></p>
      </footer>
    </div>
