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
    'curl -O ' + github + '.jshintrc',
    'curl -O ' + github + 'Gruntfile.js',
    'curl -O ' + github + 'package.json',

    // make some dirs to put the files into
    'mkdir img',
    'mkdir img/sprites',
    'mkdir img/sprites-retina',
    'mkdir js',
    'mkdir js/libs',
    'mkdir scss',
    'mkdir scss/base',
    'mkdir scss/config',
    'mkdir scss/extends',
    'mkdir scss/layouts',
    'mkdir scss/mixins',
    'mkdir scss/modules',

    // pull the scss files
    'curl -o scss/main.scss '                 + github + 'scss/main.scss',
    'curl -o scss/config/_variables.scss '    + github + 'scss/config/_variables.scss',
    'curl -o scss/config/_includes.scss '     + github + 'scss/config/_includes.scss',
    'curl -o scss/base/_base.scss '           + github + 'scss/base/_base.scss',
    'curl -o scss/base/_normalize.scss '      + github + 'scss/base/_normalize.scss',
    'curl -o scss/base/_print.scss '          + github + 'scss/base/_print.scss',
    'curl -o scss/mixins/_icons.scss '        + github + 'scss/mixins/_icons.scss',
    'curl -o scss/mixins/_images.scss '       + github + 'scss/mixins/_images.scss',
    'curl -o scss/mixins/_mediaqueries.scss ' + github + 'scss/mixins/_mediaqueries.scss',
    'curl -o scss/mixins/_sprites.scss '      + github + 'scss/mixins/_sprites.scss',
    'curl -o scss/mixins/_typography.scss '   + github + 'scss/mixins/_typography.scss',
    'curl -o scss/extends/_helpers.scss '     + github + 'scss/extends/_helpers.scss',
    'curl -o scss/layouts/_wrapper.scss '     + github + 'scss/layouts/_wrapper.scss',
    'curl -o scss/layouts/_header.scss '      + github + 'scss/layouts/_header.scss',
    'curl -o scss/layouts/_content.scss '     + github + 'scss/layouts/_content.scss',
    'curl -o scss/layouts/_sidebar.scss '     + github + 'scss/layouts/_sidebar.scss',
    'curl -o scss/layouts/_footer.scss '      + github + 'scss/layouts/_footer.scss',
    'curl -o scss/modules/_colorbox.scss '    + github + 'scss/modules/_colorbox.scss',
    'curl -o scss/modules/_columns.scss '     + github + 'scss/modules/_columns.scss',
    'curl -o scss/modules/_media.scss '       + github + 'scss/modules/_media.scss',

    // get some default js-files
    'curl -o js/libs/modernizr.min.js ' + github + 'js/libs/modernizr.min.js',
    'curl -o js/libs/jquery.min.js ' + github + 'js/libs/jquery.min.js',
    'curl -o js/libs/jquery.colorbox.js ' + github + 'js/libs/jquery.colorbox.js',
    'curl -o js/script.js ' + github + 'js/script.js',

    // get a default spinner image
    'curl -o img/loading.gif ' + github + 'img/loading.gif',

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
      cmds.push('curl -o js/libs/jquery.' + el + '.js ' + github + 'js/libs/jquery.' + el + '.js');
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

