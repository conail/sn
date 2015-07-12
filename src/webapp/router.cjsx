require '../../assets/css/main.css'
React        = require 'react'
window.React = React
Router       = require('react-router')
Route        = Router.Route
App          = require './AppLayout'
RegisterForm = require './RegisterForm'
Profile      = require './Profile'
CourseList   = require './CourseList'
Homepage     = require './Homepage'
BasicCalculator = require './BasicCalculator'

routes = (
  <Route handler={App}>
    <Route name="register" handler={RegisterForm} path="/register"/>
    <Route name="profile" handler={Profile} path="/profile"/>
    <Route name="courses" handler={CourseList} path="/courses"/>
    <Route name="homepage" handler={Homepage} path="/"/>
    <Route name="basicCalculator" handler={BasicCalculator} path="/calc"/>
  </Route>
)

window.onload = Router.run(routes, (Handler) ->
  React.render <Handler/>, document.body
)
