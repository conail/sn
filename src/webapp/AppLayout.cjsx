Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

AppLayout = React.createClass
  displayName: 'App'
  render: ->
    <div id="app">
      <header>
        <nav id="user">
          <Link to="register">Register</Link>
          <a href="/login">Login</a>
        </nav>
        <nav id="primary">
          <Link to="profile">Home</Link>
          <Link to="profile">Profile</Link>
          <Link to="courses">Courses</Link>
        </nav>
      </header>
      <main>
        <RouteHandler/>
      </main>
      <footer>
        <p class="copyright">Copyright &copy; 2015</p>
      </footer>
    </div>

module.exports = AppLayout
