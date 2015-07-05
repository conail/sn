require '../../build/global.css'
React        = require 'react'
window.React = React
Router       = require('react-router')
Route        = Router.Route
App          = require './components/AppLayout.cjsx'
Profile      = require './components/Profile'
Courses      = require './components/Courses'

routes = (
  <Route handler={App}>
    <Route name="profile" handler={Profile} path="/"/>
    <Route name="courses" handler={Courses} path="/courses"/>
  </Route>
)

window.onload = Router.run(routes, (Handler) ->
  React.render <Handler/>, document.body
)
