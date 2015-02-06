'use strict'

gulp        = require 'gulp'
browserify  = require 'browserify'
#transform   = require 'vinyl-transform'
source     = require 'vinyl-source-stream'
express = require 'express'

gulp.task 'browserify', ->

  browserify
    entries: ['./app/main.coffee']
    extensions: ['.coffee', '.js', '.cjsx', '.jsx']
  #.transform 'coffeeify'
  #.transform 'reactify'
  .transform 'coffee-reactify'
  #.transform 'uglifyify'
  .bundle()
  .pipe source 'main.js'
  .pipe gulp.dest 'dest'


gulp.task 'express', ->

  app = express()
  app.use express.static(__dirname)
  app.listen 4000



gulp.watch './app/*', ['browserify']

gulp.task 'default', ['express', 'browserify']
