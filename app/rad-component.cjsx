
React = require 'react'

module.exports = React.createClass


  render: ->
    <div className="rad-component">
      <p>is this component rad? {@props.user.get('username')}</p>
    </div>
