gulp       = require 'gulp'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
uglify     = require 'gulp-uglify'
watch      = require 'gulp-watch'
browserify = require 'browserify'

gulp.task 'browserify', ->
  browserify
      entries: ['./libraries.coffee']
      extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .pipe source 'bundle.js'
  .pipe buffer()
  .pipe uglify(output: {comments: /^!|@preserve|@licence|@cc_on/i} )
  .pipe gulp.dest './app/assets/javascripts/'

gulp.task 'default', ['browserify']
