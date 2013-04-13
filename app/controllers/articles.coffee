mongoose = require 'mongoose'
_ = require 'underscore'

Article = mongoose.model 'Article'

#
# New article form
#
exports.new = (req, res) ->
  res.render 'articles/new',
    article: new Article({})
  return

#
# Create new article
#
exports.create = (req, res) ->
  article = new Article req.body
  article.save (err) ->
    if err
      res.render 'articles/new',
        errors: err.errors
        article: article
    res.redirect '/articles'
    return
  return

exports.show = (req, res) ->
  undefined

#
# Article edit form
#
exports.edit = (req, res) ->
  article = req.article
  res.render 'articles/edit',
    article:article
  return

#
# Update article
#
exports.update = (req, res) ->
  article = req.article
  
  article = _.extend article, req.body
  article.save (err) ->
    if err
      res.render 'articles/edit',
        article:article
        errors: err.errors
    else
      req.flash 'notice', article.title + ' was successfully updated.'
      res.redirect '/articles'
    return
  return

#
# Delete article
#
exports.destroy = (req, res) ->
  article = req.article
  article.remove (err) ->
    req.flash 'notice', article.title + ' was successfully deleted.'
    res.redirect '/articles'

#
# Manage articles
#
exports.manage = (req, res) ->
  Article.list (err, articles) ->
    res.render 'articles/manage',
      articles: articles
      message: req.flash 'notice'
    return

#
# Articles index
#
exports.index = (req, res) ->
  Article.list (err, articles) ->
    res.render 'articles/index',
      articles: articles
  return

#
# Find article by ID
#
exports.article = (req, res, next, id) ->
  Article.findById(id).exec (err, article) ->
    return next err if err
    return next new Error 'Failed to load article' if not article
      
    req.article = article
    next()
    return
  return