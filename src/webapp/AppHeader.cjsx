Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'AppHeader'

  siteTitle: 'Site Title'
  
  style: 
    header:
      backgroundColor: '#069'
      color: '#FFF'
      padding: '1em'

  render: ->
    <header style={@style.header}>
      <h1>{@siteTitle}</h1>
      <nav id="user">
        <Link to="profile">Profile</Link>
        <a href="/logout">Logout</a>
      </nav>
      <nav id="primary">
        <a href="/">Home</a>
        <Link to="courses">Courses</Link>
      </nav>
    </header>
