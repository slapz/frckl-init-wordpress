/*global module:false*/
module.exports = function(grunt) {

  grunt.initConfig({
    meta: {
      banner: '/*! PROJECTNAME | Last modified: ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        'Steffen Becker | http://webgefrickel.de */'
    },

    lint: {
      files: ['grunt.js', 'js/script.js']
    },

    concat: {
      dist: {
        src: ['<banner:meta.banner>',
          'js/jquery.colorbox.js',
          'js/script.js'
        ],
        dest: 'js/script.min.js'
      }
    },

    min: {
      dist: {
        src: ['<banner:meta.banner>', '<config:concat.dist.dest>'],
        dest: '<config:concat.dist.dest>'
      }
    },

    compass: {
      dev: {
        src: 'scss',
        dest: 'css',
        images: 'img',
        fonts: 'fonts',
        relativeassets: true,
        outputstyle: 'expanded',
        linecomments: true
      },
      deploy: {
        src: 'scss',
        dest: 'css',
        images: 'img',
        fonts: 'fonts',
        relativeassets: true,
        outputstyle: 'compressed',
        linecomments: false,
        forcecompile: true
      }
    },

    pngmin: {
      src: 'img/*.png',
      dest: 'img'
    },

    jpgmin:  {
      src: 'img/*.jpg',
      dest: 'img'
    },

    watch: {
      files: ['<config:lint.files>', 'scss/*.scss'],
      tasks: 'default'
    },

    // jshint config options
    jshint: {
      options: {
        bitwise: true,
        browser: true,
        curly: true,
        eqeqeq: true,
        eqnull: true,
        immed: true,
        jquery: true,
        latedef: true,
        newcap: true,
        noarg: true,
        nonew: true,
        plusplus: true,
        regexp: true,
        trailing: true,
        undef: true
      }
    },

    // the browser-reload task used in default
    macreload: {
      fuckyeah: {
        browser: 'chrome',
        editor: 'iterm'
      }
    }

  });

  // registering default and deploy tasks -- default is used in watch too
  grunt.registerTask('default', 'compass:dev lint concat macreload');
  grunt.registerTask('deploy', 'compass:deploy lint concat min pngmin jpgmin');

  // plugin tasks (grunt compass imagine etc., yeah!)
  // install these with npm -g or install locally and change path
  grunt.loadNpmTasks('grunt-compass');
  grunt.loadNpmTasks('grunt-imagine');
  grunt.loadNpmTasks('grunt-macreload');
};
