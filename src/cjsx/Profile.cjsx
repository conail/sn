Profile = React.createClass
  render: ->
    <div class="profile">
      <header>
        <h1>John Smith</h1>
        <img src="/img/avatar.png"/> 
        <ul class="actions">
          <li>Private Message</li>
        </ul>
      </header>
      <dl class="metadata">
        <div class="privacy-controls">
        </div>
        <dt>Joined</dt>
        <dd>June 1, 2015</dd>
        <dt>Last Seen</dt>
        <dd>June 12, 2015</dd>
        <dt>Phone</dt>
        <dd></dd>
      </dl>
      <div class="activity panel">
        <h2>Recent Activity</h2>
      </div>
      <div class="badges panel">
        <h2>Badges</h2>
        <p>AP1</p>
      </div>
      <div class="courses panel">
        <h2>Course</h2>
      </div>
    </div>
