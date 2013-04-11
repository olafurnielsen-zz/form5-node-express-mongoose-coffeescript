module.exports = (app, passport, auth) ->
  
  # User routes
  users = require '../app/controllers/users'
  app.get '/login', users.login

  app.post '/login', passport.authenticate('local',
    failureRedirect: '/login'
    failureFlash: true),

    (req, res) ->
      res.redirect '/'
      return

  app.get '/logout', users.logout
  
  app.get '/users', auth.requiresLogin, users.index
  app.get '/users/new', auth.requiresLogin, users.new
  app.post '/users', auth.requiresLogin, users.create
  app.get '/users/:userId/edit', auth.requiresLogin, users.edit
  app.put '/users/:userId', auth.requiresLogin, users.update
  app.get '/users/:userId/destroy', auth.requiresLogin, users.destroy

  app.param 'userId', users.user

  # Article routes
  articles = require '../app/controllers/articles'
  app.get '/', articles.index
  app.get '/articles/:id', articles.show
  app.get '/articles/new', auth.requiresLogin, articles.new
  app.post '/articles', auth.requiresLogin, articles.create
  app.get '/articles/:id/edit', auth.requiresLogin, articles.edit
  app.put '/articles/:id', auth.requiresLogin, articles.update
  app.del '/articles/:id', auth.requiresLogin, articles.destroy

  return