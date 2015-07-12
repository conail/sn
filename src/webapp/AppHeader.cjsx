Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'AppHeader'

  siteTitle: 'Site Title'
  
  render: ->
    <header>
      <h1>{@siteTitle}</h1>
      <nav id="primary">
        <Link to="homepage">Home</Link>
        <Link to="courses">Courses</Link>
        <Link to="basicCalculator">Calculator</Link>
      </nav>
      <nav id="user">
        <Link to="profile">Profile</Link>
        <a href="/logout">Logout</a>
      </nav>
    </header>
