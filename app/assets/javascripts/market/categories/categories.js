angular.module('categoriesModule', [], ['$routeProvider', function($routeProvider){

    $routeProvider.when('/', {
        templateUrl:'categories/index.html',
        controller:'categoriesController',
        controllerAs: 'categories',
        resolve: {
            "products": function(productFactory){
                return productFactory.products().query().$promise
            }
        }
    }).
    when('/c/:category', {
        templateUrl:'categories/index.html',
        controller:'categoriesController',
        controllerAs: 'categories',
        resolve: {
            "products": function($route,productFactory){
                return productFactory.products().query({categories: $route.current.params.category}).$promise
            }
        }
    });

}]);

angular.module('categoriesModule').controller('categoriesController', ['$scope', 'products', function($scope, products){
        var vm = this;
        vm.products = products.products;
}]);
