#
# Module dependencies
#
mongoose = require 'mongoose'
_ = require 'underscore'

user = mongoose.model 'User'

#
# Show login form
#
exports.login = (req, res) ->
  res.render 'users/login',
    title: 'Login'
    message: req.flash 'error'
  return

#
# Logout
#
exports.logout = (req, res) ->
  req.logout()
  res.redirect '/'
  return

#
# List users
#
exports.index = (req, res) ->
  res.render 'users/index'
  return

#
# Display new user form
#
exports.new = (req, res) ->
  res.render 'users/new'
  return

#
# Create user
#

exports.create = (req, res) ->
  user = new User req.body
  user.save (err) ->
    res.render 'users/new',
      errors: err.errors
      user: user

#
# Find user by id
#

exports.user = (req, res, next, id) ->
  User.findById(id)
    .exec (err, user) ->
      return next err if err
      return next new Error 'Failed to load user' if not user
        
      req.profile = user
      next()
      return
  return

#
# Show edit form for users
#
exports.edit = (req, res) ->
  User.findById req.params.id, (err, user) ->
    res.redirect '/users' if not user
    res.render 'users/edit',
      user: user
    return

  return

#
# Update user
#
exports.update = (req, res) ->
  user = req.profile
  user = _.extend user, req.body
  
  user.save (err) ->
    if err
      res.render '/users/' + user.id + '/edit',
        title: 'Edit user'
        user: user
        errors: err.errors
    else
      res.redirect '/users'
    return 
  return

#
# Delete user
#
exports.destroy = (req, res) ->
  
  User.findById( req.params.id, (err, user) ->
    if !user
      res.redirect '/users'
    user.remove()
    res.redirect '/users'
  )
  return




