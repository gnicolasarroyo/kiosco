"use strict"

// -- DEPENDENCIES -------------------------------------------------------------
var gulp    = require('gulp');
var coffee  = require('gulp-coffee');
var concat  = require('gulp-concat');
var connect = require('gulp-connect');
var header  = require('gulp-header');
var uglify  = require('gulp-uglify');
var gutil   = require('gulp-util');
var pkg     = require('./package.json');

// -- FILES --------------------------------------------------------------------
var path = {
  build        : './www/assets',
  jquerymobile : {
    js     :    [
                  'bower_components/jquery-mobile/build/jquery-1.11.1.min.js', 
                  'bower_components/jquery-mobile/build/jquery.mobile-1.4.3.min.js'
                ],
    css    :    'bower_components/jquery-mobile/build/jquery.mobile-1.4.3.min.css',
    images :    'bower_components/jquery-mobile/css/themes/default/images/**/*.*'
  },
  backbone     : [
    'bower_components/underscore/underscore.js',
    'bower_components/backbone/backbone.js']
};

var source = {
  coffee: [ 'source/app.coffee',
            'source/app.init.coffee',
            'source/models/*.coffee',
            'source/collections/*.coffee',
            'source/views/*.coffee',
            'source/routers/*.coffee',
            'source/app.main.coffee'], 
  templates: 'source/templates/*.html',
  data     : 'source/data/*.json'};

var banner = ['/**',
  ' * <%= pkg.name %>',
  ' * @version v<%= pkg.version %>',
  ' * @author  <%= pkg.author %>',
  ' */',
  ''].join('\n');

// -- TASKS --------------------------------------------------------------------
gulp.task('core', function() {
  gulp.src(path.jquerymobile.js)
    .pipe(concat(pkg.name + '.base.js'))
    .pipe(gulp.dest(path.build + '/js'));

  gulp.src(path.jquerymobile.css)
    .pipe(concat(pkg.name + '.base.css'))
    .pipe(gulp.dest(path.build + '/css'));

  gulp.src(path.jquerymobile.images)
    .pipe(gulp.dest(path.build + '/css/images'));

  gulp.src(path.backbone)
    .pipe(concat(pkg.name + '.core.js'))
    .pipe(uglify({mangle: false}))
    .pipe(header(banner, {pkg: pkg}))
    .pipe(gulp.dest(path.build + '/js'));
});

gulp.task('coffee', function() {
  gulp.src(source.coffee)
    .pipe(concat(pkg.name + '.app.coffee'))
    .pipe(coffee().on('error', gutil.log))
    .pipe(uglify({mangle: false}))
    .pipe(header(banner, {pkg: pkg}))
    .pipe(gulp.dest(path.build + '/js'))
    .pipe(connect.reload());
});

gulp.task('templates', function() {
  gulp.src(source.templates)
    .pipe(gulp.dest(path.build + '/templates'));
});

gulp.task('data', function() {
  gulp.src(source.data)
    .pipe(gulp.dest(path.build + '/data'));
});

gulp.task('webserver', function() {
  connect.server({ port: 8000, root: 'www/', livereload: true });
});

gulp.task('init', function() {
  gulp.run(['coffee'])
});

gulp.task('default', function() {
  gulp.run(['webserver'])
  gulp.watch(source.coffee, ['coffee']);
  gulp.watch(source.templates, ['templates']);
  gulp.watch(source.data, ['data']);
});
