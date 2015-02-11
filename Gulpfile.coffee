'use strict'

gulp        = require 'gulp'
browserify  = require 'browserify'
source     = require 'vinyl-source-stream'
server = require './server'

gulp.task 'browserify', ->

  browserify
    entries: ['./app/main.coffee']
    extensions: ['.coffee', '.js', '.cjsx', '.jsx']
  .transform 'coffee-reactify'
  #.transform 'uglifyify'
  .bundle()
  .pipe source 'main.js'
  .pipe gulp.dest 'dest'

gulp.task 'server', ->

  app = server()

gulp.watch './app/*', ['browserify']

gulp.task 'default', ['server', 'browserify']
