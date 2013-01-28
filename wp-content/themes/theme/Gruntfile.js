/*global module:false*/
module.exports = function(grunt) {

  grunt.initConfig({

    jshint: {
      // add all files you want to be checked for errors here
      all: [
        'Gruntfile.js',
        'js/script.js'
      ],
      // change the options to your liking -- see http://www.jshint.com/docs/
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

    concat: {
      all: {
        // add further non-minified js-files for concatenation here
        src: [
          'js/jquery.colorbox.js',
          'js/script.js'
        ],
        dest: 'js/script.min.js'
      }
    },

    uglify: {
      all: {
        src: '<%= concat.all.dest %>',
        dest: '<%= concat.all.dest %>'
      }
    },

    compass: {
      dev: {
        src: 'scss',
        dest: 'css',
        images: 'img',
        fonts: 'fonts',
        relativeassets: true,
        debugsass: true,
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

    /* TODO imagine produces errors when using grunt 0.4.0a
    pngmin: {
      src: 'img/*.png',
      dest: 'img'
    },

    jpgmin:  {
      src: 'img/*.jpg',
      dest: 'img'
    },
    */

    watch: {
      files: [
        '<%= jshint.all %>',
        'scss/**/*.scss',
        'scss/*.scss'
      ],
      tasks: 'default'
    },

    // the browser-reload task used in default
    macreload: {
      all: {
        browser: 'chrome',
        editor: 'iterm'
      }
    }

  });

  // registering default and deploy tasks -- default is used in watch too
  grunt.registerTask('default', ['compass:dev', 'jshint', 'concat', 'macreload']);
  grunt.registerTask('deploy', ['compass:deploy', 'jshint', 'concat', 'uglify'/*, 'pngmin', 'jpgmin'*/]);

  // plugin tasks (grunt compass imagine etc., yeah!)
  // install these running npm install next to the Gruntfile / package.json
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-compass');
  grunt.loadNpmTasks('grunt-macreload');
  // grunt.loadNpmTasks('grunt-imagine');

};
