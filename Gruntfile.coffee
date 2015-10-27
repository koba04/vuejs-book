module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-gitbook'
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.initConfig
    gitbook:
      development:
        input: "./"
        title: "vue.js book",
        description: "This book is vue.js guide book.",
        github: "koba04/vuejs-book"
    'gh-pages':
      options:
        base: '_book'
      src: ['**']
    clean:
      files: '.grunt'

  grunt.registerTask 'publish', [
    'gitbook'
    'gh-pages'
    'clean'
  ]
