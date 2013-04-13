module.exports =
  development:
    app:
      name: 'Form5 Node.js Skeleton'
    root: require('path').normalize(__dirname + '/..')
    db: process.env.MONGOLAB_URI || process.env.MONGOHQ_URL \
        || 'mongodb://localhost/skeleton'