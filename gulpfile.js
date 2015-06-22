var gulp = require('gulp');
var cjsx = require('gulp-cjsx');
 
gulp.task('cjsx', function() {
  gulp.src('./cjsx/*.cjsx').pipe(cjsx({bare: true})).pipe(gulp.dest('./public/'))
});
