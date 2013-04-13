mongoose = require 'mongoose'
bcrypt = require 'bcrypt'

#
# User Schema
#
Schema = mongoose.Schema

UserSchema = new Schema
  name:
    type: String
    required: true
  email:
    type: String
    required: true
  username:
    type: String
    required: true
    unique: true
  password:
    type: String
    required: true
  created:
    type: Date
    default: Date.now

#
# Hash password before saving
#
UserSchema.pre 'save', (next) ->
  user = this
  SALT_WORK_FACTOR = 10

  if !user.isModified 'password'
    console.log 'Password not modified'
    return next()

  return next() unless user.isModified 'password'

  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    return next err if err
    bcrypt.hash user.password, salt, (err, hash) ->
      return next err if err
      user.password = hash
      next()
      return

    return

#
# Compare password method for authentication
#
UserSchema.methods.comparePassword = (candidatePassword, cb) ->
  bcrypt.compare candidatePassword, this.password, (err, isMatch) ->
    if err
      return cb err
    cb(null, isMatch)


UserSchema.statics =
  list: (cb) ->
    this.find().sort
      username: 1
    .exec(cb)
    return

User = mongoose.model 'User', UserSchema

###
user = new User
  username: 'oon'
  password: 'oon'
  email: 'olafur@form5.is'
  name: 'Ólafur Örn Nielsen'
user.save (err) ->
  if err
    console.log err
  else
    console.log 'Created user: ' + user.username
###