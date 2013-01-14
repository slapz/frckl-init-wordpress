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
