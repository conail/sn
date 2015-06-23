'use strict';
 
var gulp = require('gulp');
var sass = require('gulp-sass');
var cjsx = require('gulp-cjsx');
 
gulp.task('cjsx', function() {
  gulp.src('./src/cjsx/**/*.cjsx')
    .pipe(cjsx({bare: true}))
    .pipe(gulp.dest('./src/public/js'))
});

gulp.task('sass', function () {
  gulp.src('./src/sass/**/*.sass')
    .pipe(sass.sync().on('error', sass.logError))
    .pipe(gulp.dest('./src/public/css'));
});

gulp.task('watch', function () {
  gulp.watch('./src/sass/**/*.sass', ['sass']);
  gulp.watch('./src/cjsx/**/*.csjx', ['cjsx']);
});
