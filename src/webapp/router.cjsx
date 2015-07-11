React        = require 'react'
window.React = React
Router       = require('react-router')
Route        = Router.Route
App          = require './AppLayout'
RegisterForm = require './RegisterForm'
Profile      = require './Profile'
Courses      = require './Courses'
Homepage     = require './Homepage'

routes = (
  <Route handler={App}>
    <Route name="register" handler={RegisterForm} path="/register"/>
    <Route name="profile" handler={Profile} path="/profile"/>
    <Route name="courses" handler={Courses} path="/courses"/>
    <Route name="homepage" handler={Homepage} path="/"/>
  </Route>
)

window.onload = Router.run(routes, (Handler) ->
  React.render <Handler/>, document.body
)
