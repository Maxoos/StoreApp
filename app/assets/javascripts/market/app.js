angular.module('market', ['ngRoute','ngResource','templates','ui.bootstrap.showErrors','sessionModule','categoriesModule', 'shopsModule', 'accountModule']);

angular.module('market').config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider.otherwise({redirectTo:'/'});
}]);


// URL Helper
// Usage: ng-href="{{ path('LibraryController', { bookId : 'x', chapterId : 'y' }) }}"
// MODIFIED VERSION OF: http://stackoverflow.com/questions/15324039/how-to-create-a-url-for-link-helper-in-angularjjs
// Original version struggled when multiple routes use the same controller... a common practice. Modified here to
// look for exact match for specified params.
angular.module('market').run(function($route, $rootScope,$location) {

    $rootScope.railsHelpers = {
        errorResponce: function(response,form){
            console.log("error responce from API", response);
            var errors = response.data.errors;
            for (var key in errors) {
                if(errors.hasOwnProperty(key)){
                    form[key].$dirty = true;
                    form[key].$setValidity(errors[key][0], false);
                }
            }
        }
    };

    $rootScope.path = function(controller, params) {

        // Iterate over all available routes
        for (var path in $route.routes) {

            // First match the controller
            if ($route.routes[path].controller != controller) continue;

            // Then match the params
            var paramsMatched = true;
            var result = path;
            for (var i = 0; i < $route.routes[path].keys.length; i++) {
                var key = $route.routes[path].keys[i];
                if (!(key.name in params) && !key.optional) {
                    paramsMatched = false;
                    break;
                }

                // Construct the path with given parameters in it
                result = result.replace(new RegExp(':' + key.name + '[?*]?'), function() {
                    return key.name in params ? params[key.name] : '';
                });
            }
            if (!paramsMatched) continue;

            return result;
        }

        // No such controller in route definitions
        return undefined;
    };

    $rootScope.redirect = function(controller,path) {
        var _path = this.path(controller,path)
        if (_path) { $location.path(_path)}
        return
    }
});
