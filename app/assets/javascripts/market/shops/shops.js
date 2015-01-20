angular.module('shopsModule', [], ['$routeProvider',  function($routeProvider){

    $routeProvider.when('/:shop_slug', {
        templateUrl:'/shops/show.html',
        controller:'shopShowController',
        resolve: {
            "shop": function(shopFactory,$route){
                return shopFactory.shop($route.current.params.shop_slug).$promise
            }
        }
    }).
    when('/:shop_slug/:id',{
            templateUrl:'/shops/products/show.html',
            controller:'shopProductShowController',
            resolve: {
                "shop_product": function(shopFactory,$route){
                    return shopFactory.shop_product($route.current.params.shop_slug,$route.current.params.id).$promise
                }
            }
        });

}]);

angular.module('shopsModule').controller('shopShowController', ['$scope', 'shop', 'shopFactory', 'productFactory', function($scope, shop, shopFactory, productFactory ){
    $scope.shop = shop.shop;
    productFactory.shop_products($scope.shop.id).$promise.then(function(products){
        $scope.products = products.products;
    });
}]);

angular.module('shopsModule').controller('shopProductShowController', ['$scope', 'shop_product','productFactory', function($scope, shop_product, shopFactory ){
    $scope.product = shop_product.product;
}]);
