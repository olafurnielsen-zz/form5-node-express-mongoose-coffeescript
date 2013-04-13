
#
# Global template helpers
#
module.exports = (app) ->
  
  #
  # Template function for Markdown rendering
  #
  marked = require 'marked'
  app.locals.marked = marked
  
  #
  # Named date parsing functions
  #
  moment = require 'moment'
  
  app.locals.dateShortMon = (date) ->
    return moment(date).format 'MMM DD'