React        = require 'react'
window.React = React
Router       = require('react-router')
Route        = Router.Route
App          = require './AppLayout'
RegisterForm = require './RegisterForm'
Profile      = require './Profile'
Courses      = require './Courses'

routes = (
  <Route handler={App}>
    <Route name="register" handler={RegisterForm} path="/register"/>
    <Route name="profile" handler={Profile} path="/"/>
    <Route name="courses" handler={Courses} path="/courses"/>
  </Route>
)

window.onload = Router.run(routes, (Handler) ->
  React.render <Handler/>, document.body
)
