/*global desc: true*/
/*global task: true*/
/*global jake: true*/
/*global console: true*/
/*global exec: true*/

desc('Default task');
task('default', [], function(params) {
  console.log('Installing NPM-packages and everything you need from github.com/nebelschwade/webgefrickel...');

  var cmds = [
    'mkdir scss/extends',
    'mkdir scss/mixins',
    'mkdir scss/modules',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/main.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_base.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_helpers.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_normalize.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_print.scss',
    'wget -P scss/extends https://raw.github.com/nebelschwade/webgefrickel/master/scss/extends/_global.scss',
    'wget -P scss/mixins https://raw.github.com/nebelschwade/webgefrickel/master/scss/mixins/_icons.scss',
    'wget -P scss/mixins https://raw.github.com/nebelschwade/webgefrickel/master/scss/mixins/_mediaqueries.scss',
    'wget -P scss/mixins https://raw.github.com/nebelschwade/webgefrickel/master/scss/mixins/_typography.scss',
    'wget -P scss/modules https://raw.github.com/nebelschwade/webgefrickel/master/scss/modules/_columns.scss',
    'wget -P scss/modules https://raw.github.com/nebelschwade/webgefrickel/master/scss/modules/_media.scss',
    'wget -P scss/modules https://raw.github.com/nebelschwade/webgefrickel/master/scss/modules/_colorbox.scss',

    'mkdir js',
    'wget -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/modernizr.min.js',
    'wget -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/jquery.min.js',
    'wget -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/jquery.colorbox.js',
    'wget -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/script.js',

    'mkdir img',
    'mkdir img/icons',
    'wget -P img https://raw.github.com/nebelschwade/webgefrickel/master/img/loading.gif',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-close-hover.png',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-close.png',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-next-hover.png',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-next.png',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-prev-hover.png',
    'wget -P img/icons https://raw.github.com/nebelschwade/webgefrickel/master/img/icons/colorbox-prev.png',

    'npm install',

    'grunt'
  ];

  jake.exec(cmds, function() {
    console.log('\n==========================================');
    console.log('===== Complete. Start coding now :-) =====');
    console.log('==========================================');
  }, { printStdout: true } );
});


desc('Update default JS Libs');
task('updatejs', [], function(params) {
  console.log('Updating default JS libs...');

  // update jquery, modernizr + colorbox by default
  var cmds = [
    'wget -N -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/modernizr.min.js',
    'wget -N -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/jquery.min.js',
    'wget -N -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/jquery.colorbox.js'
  ];

  jake.exec(cmds, function() {
    console.log('\n================================================');
    console.log('===== JS Libs were updated. Back to work!  =====');
    console.log('================================================');
  }, { printStdout: true } );

});


desc('Installing/updating JS Libs');
task('libs', [], function(a, b, c, d, e, f, g, h, i, j, k) {
  console.log('Installing/updating default JS libs...');

  var cmds = [];
  var options = [a, b, c, d, e, f, g, h, i, j, k];

  options.forEach(function(el) {
    if (el !== undefined) {
      cmds.push('wget -N -P js https://raw.github.com/nebelschwade/webgefrickel/master/js/jquery.' + el + '.js');
    }
  });

  if (cmds.length) {
    jake.exec(cmds, function() {
      console.log('\n================================================');
      console.log('===== JS Libs were updated. Back to work!  =====');
      console.log('================================================');
    }, { printStdout: true } );
  } else {
    console.log('\n===============================================');
    console.log('===== Usage: jake libs[cycle,backstretch] =====');
    console.log('===============================================');
  }

});

