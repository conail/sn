gulp    = require 'gulp'
gutil   = require 'gulp-util'
sass   = require 'gulp-sass'
webpack = require 'webpack'
map     = require 'map-stream'
touch   = require 'touch'
_ = require 'underscore'
$ = require('gulp-load-plugins')()


gulp.task 'sass', ->
  gulp.src('src/sass/**/*.sass').pipe(sass({ errLogToConsole: true })).pipe(gulp.dest('./build/'));

# Production Settings
gulp.task 'webpack:build', (callback) ->
  config = require './webpack.production.config.js'
  webpack config, (err, stats) ->
    throw new gutil.PluginError('webpack:build', err) if err
    gutil.log '[webpack:build]', stats.toString(colors: true)
    callback()
    return

# Development Settings
devConfig   = require './webpack.config.js'
devCompiler = webpack devConfig
devServer   = {}
gulp.task 'webpack:build-dev', (callback) ->
  devCompiler.run (err, stats) ->
    throw new gutil.PluginError('webpack:build-dev', err) if err
    gutil.log '[webpack:build-dev]', stats.toString(colors: true)
    callback()
    return
  return
gulp.task 'webpack-dev-server', ['sass'], (callback) ->
  touch.sync('./assets/main.css', time: new Date(0))
  DevServer = require('webpack-dev-server')
  devServer = new DevServer(webpack(devConfig),
    contentBase: './build/'
    hot: true
    watchDelay: 100
    noInfo: true
  )
  devServer.listen 8080, '0.0.0.0', (err) ->
    throw new gutil.PluginError('webpack-dev-server', err) if err
    gutil.log '[webpack-dev-server]', 'http://localhost:8080'
    callback()
  return

# CLI Settings
gulp.task 'copy-assets', ->
  gulp.src(['assets/**']).pipe(gulp.dest('build')).pipe($.size())
gulp.task 'default', -> gulp.start 'build'
gulp.task 'build', ['webpack:build', 'copy-assets']
gulp.task 'watch', ['copy-assets', 'webpack-dev-server'], ->
  gulp.watch ['src/sass/**'], ['sass']
  gulp.watch ['src/webapp/**'], ['copy-assets']
