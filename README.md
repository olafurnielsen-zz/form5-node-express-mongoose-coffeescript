# A Node.js skeleton using Express, Mongoose and Coffeescript

Do you find yourself looking around for Node.js conventions and how to structure your Node application? Firstly, this skeleton shows how a Node.js web application can be structured properly. Secondly, it demonstrates how some popular modules that provide basic functionalities for your app can be used.

I haven't been using Node.js for long but here I've gathered some of the good things I have come across on my short journey. Hope this can help you get started.

**You can find this demo running on Heroku:**
[http://form5-node-skeleton.herokuapp.com/](http://form5-node-skeleton.herokuapp.com/)

Log in using admin/admin to manage users & articles.

## Install

Assuming you have Node.js and npm installed, to get started developing using this skeleton, run:

```sh
	$ git clone git://github.com/olafurnielsen/form5-node-express-mongoose-coffeescript.git
	$ npm install
	$ bin/devserver
```

Open [http://localhost:3000/](http://localhost:3000) in your browser.

## What does this skeleton provide you with?

- A good way to structure your Express.js application.
- Object modeling for MongoDB using [Mongoose](http://mongoosejs.com/).
- [Passport.js](http://passportjs.org/) for user authentication.
- [Twitter Bootstrap](http://twitter.github.io/bootstrap/), to jumpstart your UI development.
- [connect-assets](https://github.com/adunkman/connect-assets) for serving CSS, Javascript and images to the client supporting Coffeescript and LESS on the fly.
- [connect-flash](https://github.com/jaredhanson/connect-flash) for helpful error/notice messages.
- [connect-mongo](https://github.com/kcbanner/connect-mongo) for persistent session storage.
- Coffeescript linting using [Grunt](http://gruntjs.com/).
- [node-dev](https://github.com/fgnass/node-dev), an awesome development tool for Node.js that automatically restarts your node process when a script is modified. It also has useful growl notifications:

![Screenshot](http://fgnass.github.com/images/node-dev.png)

And much more...

## File structure
```
-app/
  |--controllers/
  |--models/
  |--views/
  |__helpers/ (template helper functions)
-config/
  |--routes.coffee
  |--environment.coffee
  |--passport.coffee (auth config)
  |--express.coffee (express.js config)
  |--middlewares/ (custom middlewares)
-assets/ (Client side assets)
  |--css/ (supports LESS)
  |--js/ (supports Coffescript)
  |--img/
-bin/
  |__devserver (Shell script for firing up node-dev)
--server.js
```

## Inspiration and further reading

This skeleton is heavily based on [nodejs-express-mongoose-demo](https://github.com/madhums/nodejs-express-mongoose-demo) but it uses Coffeescript instead of standard javascript and implements various other modules which I think are really useful when developing an Express.js application.

[Madhums - Breaking down app.js file - nodejs, express, mongoose](http://madhums.me/2012/07/19/breaking-down-app-js-file-nodejs-express-mongoose/)

[Stack Overflow - Node.js & Express.js: Breaking up the app.js file](http://stackoverflow.com/questions/7732293/node-js-express-js-breaking-up-the-app-js-file)