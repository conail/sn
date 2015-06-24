React = require 'react'
Profile = require '../components/Profile'

AppLayout = React.createClass
  render: ->
    page = ''
    page = <Profile name="John Smith"/>

    <div id="app">
      <header>
        <nav id="user">
          <a href="/logout">Logout</a>
          <a href="/login">Login</a>
          <a href="/register">Register</a>
        </nav>
        <nav id="primary">
          <a href="/">Home</a>
          <a href="/users">Users</a>
        </nav>
      </header>
      <main>
        {page}
      </main>
      <footer>
        <p class="copyright">Copyright &copy; 2015</p>
      </footer>
    </div>

module.exports = AppLayout
