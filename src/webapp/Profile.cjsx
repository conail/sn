React = require 'react'

module.exports = React.createClass
  render: ->
    <div id="profile">
      <header>
        <h1>{@props.name}</h1>
        <img src="/img/avatar.png"/> 
        <ul class="actions">
          <li><button>Private Message</button></li>
        </ul>
      </header>
      <div className="metadata">
        <ul className="privacy">
          <li>Public</li>
        </ul>
        <dl>
          <dt>Joined</dt>
          <dd>June 1, 2015</dd>
          <dt>Last Seen</dt>
          <dd>June 12, 2015</dd>
          <dt>Phone</dt>
          <dd></dd>
        </dl>
      </div>
      <div className="activity panel">
        <h2>Recent Activity</h2>
      </div>
      <div className="badges panel">
        <h2>Badges</h2>
        <p>AP1</p>
      </div>
      <div className="courses panel">
        <h2>Courses</h2>
      </div>
    </div>
