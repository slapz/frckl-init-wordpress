/*global desc: true*/
/*global task: true*/
/*global jake: true*/
/*global console: true*/
/*global exec: true*/

desc('Default task');
task('default', [], function(params) {
  console.log('Installing NPM-packages and fetching default SCSS/JS-files from github.com/webgefrickel/...');

  var github = 'https://raw.github.com/webgefrickel/frckl-init-srcs/master/';
  var cmds = [
    // first get packages and jshint/grunt stuff
    'wget ' + github + '.jshintrc',
    'wget ' + github + 'Gruntfile.js',
    'wget ' + github + 'package.json',

    // make some dirs for scss and get the files
    'mkdir scss',
    'mkdir scss/base',
    'mkdir scss/config',
    'mkdir scss/extends',
    'mkdir scss/layouts',
    'mkdir scss/mixins',
    'mkdir scss/modules',
    'wget -P scss ' + github + 'scss/main.scss',
    'wget -P scss/config ' + github + 'scss/config/_variables.scss',
    'wget -P scss/config ' + github + 'scss/config/_includes.scss',
    'wget -P scss/base ' + github + 'scss/base/_base.scss',
    'wget -P scss/base ' + github + 'scss/base/_normalize.scss',
    'wget -P scss/base ' + github + 'scss/base/_print.scss',
    'wget -P scss/mixins ' + github + 'scss/mixins/_icons.scss',
    'wget -P scss/mixins ' + github + 'scss/mixins/_images.scss',
    'wget -P scss/mixins ' + github + 'scss/mixins/_mediaqueries.scss',
    'wget -P scss/mixins ' + github + 'scss/mixins/_sprites.scss',
    'wget -P scss/mixins ' + github + 'scss/mixins/_typography.scss',
    'wget -P scss/extends ' + github + 'scss/extends/_helpers.scss',
    'wget -P scss/layouts ' + github + 'scss/layouts/_wrapper.scss',
    'wget -P scss/layouts ' + github + 'scss/layouts/_header.scss',
    'wget -P scss/layouts ' + github + 'scss/layouts/_content.scss',
    'wget -P scss/layouts ' + github + 'scss/layouts/_sidebar.scss',
    'wget -P scss/layouts ' + github + 'scss/layouts/_footer.scss',
    'wget -P scss/modules ' + github + 'scss/modules/_colorbox.scss',
    'wget -P scss/modules ' + github + 'scss/modules/_columns.scss',
    'wget -P scss/modules ' + github + 'scss/modules/_media.scss',

    // make the js-dir and get some defaults
    'mkdir js',
    'wget -P js/libs ' + github + 'js/libs/modernizr.min.js',
    'wget -P js/libs ' + github + 'js/libs/jquery.min.js',
    'wget -P js/libs ' + github + 'js/libs/jquery.colorbox.js',
    'wget -P js ' + github + 'js/script.js',

    // get a default spinner image
    'mkdir img',
    'wget -P img ' + github + 'img/loading.gif',

    // install all npm-packages for grunt
    'npm install',

    // and run grunt once to verify everything is set up
    'grunt'
  ];

  jake.exec(cmds, function() {
    console.log('\n====================================================');
    console.log('===== Complete. Start coding now :-)           =====');
    console.log('===== NOTE: change baseDir in package.json     =====');
    console.log('===== to your path for working js-sourcemaps.  =====');
    console.log('====================================================');
  }, { printStdout: true } );
});


desc('Install/update JS Libs');
task('install', [], function(a, b, c, d, e, f, g, h, i, j, k) {
  console.log('Installing/updating default JS libs...');

  var cmds = [];
  var github = 'https://raw.github.com/webgefrickel/frckl-init-srcs/master/';
  var options = [a, b, c, d, e, f, g, h, i, j, k];

  options.forEach(function(el) {
    if (el !== undefined) {
      cmds.push('wget -N -P js/libs ' + github + 'js/libs/jquery.' + el + '.js');
    }
  });

  if (cmds.length) {
    jake.exec(cmds, function() {
      console.log('\n================================================');
      console.log('===== JS Libs were updated. Back to work!  =====');
      console.log('================================================');
    }, { printStdout: true } );
  } else {
    console.log('\n==================================================');
    console.log('===== Usage: jake install[cycle,backstretch] =====');
    console.log('==================================================');
  }

});

