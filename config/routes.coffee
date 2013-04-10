module.exports = (app, passport, auth) ->
  
  # User routes
  users = require '../app/controllers/users'
  app.get '/login', users.login
  app.get '/logout', users.logout
  
  app.get '/users', users.index
  app.get '/users/new', users.new
  app.post '/users', users.create
  app.get '/users/:userId/edit', users.edit
  app.put '/users/:userId', users.update
  app.del '/users/:userId', users.destroy
    
  app.param 'userId', users.user

  # Article routes
  articles = require '../app/controllers/articles'
  app.get '/articles', articles.index
  app.get '/articles/:id', articles.show
  app.get '/articles/new', auth.requiresLogin, articles.new
  app.post '/articles', auth.requiresLogin, articles.create
  app.get '/articles/:id/edit', auth.requiresLogin, articles.edit
  app.put '/articles/:id', auth.requiresLogin, articles.update
  app.del '/articles/:id', auth.requiresLogin, articles.destroy

  # Main route
  app.get '/', articles.index

  return