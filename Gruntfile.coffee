module.exports = (grunt) ->
  
  grunt.initConfig
    coffeelint:
      app: ['app/**/*.coffee', 'config/**/*.coffee']
    
  grunt.loadNpmTasks 'grunt-coffeelint'
  
  grunt.registerTask 'default', ['coffeelint']
  
  return