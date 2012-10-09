/*global desc: true*/
/*global task: true*/
/*global jake: true*/
/*global console: true*/
/*global exec: true*/


desc('Default task');
task('default', [], function(params) {
  console.log('Installing everything you need from github.com/nebelschwade/webgefrickel...');

  var cmds = [
    'npm install',

    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_base.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_colorbox.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_helpers.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_mixins.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_normalize.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/_print.scss',
    'wget -P scss https://raw.github.com/nebelschwade/webgefrickel/master/scss/main.scss',

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

    'grunt'
  ];

  jake.exec(cmds, function() {
    console.log('\n==========================================');
    console.log('===== Complete. Start coding now :-) =====');
    console.log('==========================================');
  }, { printStdout: true } );
});
