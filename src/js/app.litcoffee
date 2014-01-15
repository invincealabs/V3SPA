    v3spa = angular.module 'vespa', [
      'ngRoute',
      'vespaControllers'
    ]

    v3spa.config(['$routeProvider',
      ($routeProvider)->
        $routeProvider
          .when '/avispa', 
            templateUrl: 'partials/avispa.html',
            controller: 'avispaCtrl'

          .otherwise 
            redirectTo: '/avispa'
    ])

    v3spa.service 'TokenService', 
      class TokenGenerator
        constructor: ->
          @MAX = 9e15
          @MIN = 1e15
          @safegap = 1000
          @counter = @MIN

        generate: ->
          increment = Math.floor(@safegap*Math.random())
          if @counter > (@MAX - increment)
            @counter = @MIN
          @counter += increment
          return @counter.toString(36)

