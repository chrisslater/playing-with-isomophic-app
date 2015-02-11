User = require './models/User'
RadComponent = require './rad-component'
React = require 'react'

user = new User

React.render(RadComponent({ user: user }), document.getElementById 'container')
