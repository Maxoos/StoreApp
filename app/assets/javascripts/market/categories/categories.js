angular.module('categoriesModule', [], ['$routeProvider', function($routeProvider){

    $routeProvider.when('/', {
        templateUrl:'/categories/index.html',
        controller:'categoriesController',
        resolve: {
            "products": function(productFactory){
                return productFactory.products().$promise
            }
        }
    }).
    when('/c/:category', {
        templateUrl:'/categories/index.html',
        controller:'categoriesController',
        resolve: {
            "products": function($route,productFactory){
                return productFactory.products($route.current.params.category).$promise
            }
        }
    });

}]);

angular.module('categoriesModule').controller('categoriesController', ['$scope', 'products', 'productFactory', function($scope, products, productFactory){
        $scope.products = products.products;
}]);
