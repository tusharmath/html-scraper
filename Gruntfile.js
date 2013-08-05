'use strict';

module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({
		release: {
			options: {
				//bump: false, //default: true
				//file: 'component.json', //default: package.json
				//add: false, //default: true
				//commit: false, //default: true
				//tag: false, //default: true
				//push: false, //default: true
				//pushTags: false, //default: true
				//npm: false, //default: true
				//tagName: 'some-tag-<%= version %>', //default: '<%= version %>'
				//commitMessage: 'check out my release <%= version %>', //default: 'release <%= version %>'
				//tagMessage: 'tagging version <%= version %>' //default: 'Version <%= version %>'
			}
		},
		nodeunit: {
			files: ['test/**/*_test.js']
		},
		jshint: {
			options: {
				jshintrc: '.jshintrc'
			},
			gruntfile: {
				src: 'Gruntfile.js'
			},
			lib: {
				src: ['lib/**/*.js']
			},
			test: {
				src: ['test/**/*.js']
			}
		},
		watch: {
			gruntfile: {
				files: '<%= jshint.gruntfile.src %>',
				tasks: ['jshint:gruntfile']
			},
			lib: {
				files: '<%= jshint.lib.src %>',
				tasks: ['jshint:lib', 'nodeunit']
			},
			test: {
				files: '<%= jshint.test.src %>',
				tasks: ['jshint:test', 'nodeunit']
			}
		}
	});

	// These plugins provide necessary tasks.
	grunt.loadNpmTasks('grunt-contrib-nodeunit');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-release');

	// Default task.
	grunt.registerTask('default', ['jshint', 'nodeunit']);

};