
#
# Generic require login routing middleware
#

exports.requiresLogin = (req, res, next) ->
  return res.redirect '/login' unless req.isAuthenticated()
  next()
  return