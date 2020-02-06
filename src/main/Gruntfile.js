module.exports = function(grunt) {
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
        less: {
            files: ['webapp/WEB-INF/_ui-src/less/*.less'],
            tasks: ['less'],
        },
        fonts: {
            files: ['webapp/WEB-INF/_ui-src/fonts/*'],
            tasks: ['sync:syncfonts'],
        },
        
    },
	
	
    less: {
        default: {
            files: [
                {
                    expand: true,
                    cwd: 'webapp/WEB-INF/_ui-src/',
                    src: 'less/style.less',
                    dest: 'resources/static/',
                    ext: '.css',
                    rename:function(dest,src){
                       var nsrc = src.replace(new RegExp("less"),"css");
                       return dest+nsrc;
                    }
                }
            ]
        },
    },

    sync : {
    	syncfonts: {
    		files: [{
                expand: true,
    			cwd: 'webapp/WEB-INF/_ui-src/',
    			src: 'fonts/*',
    			dest: 'resources/static/',
    			
    		}]
    	},
    	
    }
    
});
 
  // Plugins
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-sync');
 


  // Default task(s). Run 'grunt watch' to start the watching task or add 'watch' to the task list and run 'grunt'.
  grunt.registerTask('default', ['less', 'sync']);



};