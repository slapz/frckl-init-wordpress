/*global module:false*/
module.exports = function(grunt) {

  // first - git clone git://github.com/nebelschwade/webgefrickel.git
  // and then change the path to the repo here and add js/
  var importPath = '/Users/nebelschwade/Repositories/webgefrickel/js/';

  // Project configuration.
  grunt.initConfig({
    meta: {
      banner: '/*! PROJECTNAME - your comments here | Last modified: ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        'Steffen Becker | http://webgefrickel.de | Twitter: @nebelschwade */'
    },

    lint: {
      files: ['grunt.js', 'js/script.js']
    },

    concat: {
      dist: {
        src: ['<banner:meta.banner>',
          importPath + 'jquery.colorbox.js',
          importPath + 'pagepaths.js',
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
        outputstyle: 'expanded',
        linecomments: true
      },
      deploy: {
        outputstyle: 'compressed',
        linecomments: false,
        forcecompile: true
      }
    },

    watch: {
      files: ['<config:lint.files>', 'scss/*.scss'],
      tasks: 'default'
    },

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
        regexp: true,
        trailing: true,
        undef: true
      }
    }
  });

  // registering default and deploy tasks -- default is used in watch too
  grunt.registerTask('default', 'compass:dev lint concat');
  grunt.registerTask('deploy', 'compass:deploy lint concat min');

  // plugin tasks (grunt compass, yeah!)
  grunt.loadNpmTasks('/usr/local/lib/node_modules/grunt-compass');
};
