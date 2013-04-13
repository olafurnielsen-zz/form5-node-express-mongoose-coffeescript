mongoose = require 'mongoose'

Article = mongoose.model 'Article'

exports.new = (req, res) ->
  res.render 'articles/new',
    article: new Article({})
  return

exports.create = (req, res) ->
  article = new Article req.body
  article.save (err) ->
    if err
      res.render 'articles/new',
        errors: err.errors
        article: article
    res.redirect '/'
    return
  return

exports.show = () ->
  undefined

exports.edit = () ->
  undefined

exports.update = () ->
  undefined

exports.destroy = () ->
  undefined

exports.index = (req, res) ->
  Article.list (err, articles) ->
    res.render 'articles/index',
      articles: articles
  return
  
  


