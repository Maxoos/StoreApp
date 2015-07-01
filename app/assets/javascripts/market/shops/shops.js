angular.module('shopsModule', [], ['$routeProvider',  function($routeProvider){

    $routeProvider.when('/:shop_slug', {
        templateUrl:'shops/show.html',
        controller:'shopShowController',
        controllerAs: 'shop',
        resolve: {
            "shop": function(shopFactory,$route){
                return shopFactory.shop().query({shop_slug:$route.current.params.shop_slug}).$promise
            }
        }
    }).
    when('/:shop_slug/:id',{
            templateUrl:'shops/products/show.html',
            controller:'shopProductShowController',
            controllerAs:'shop_product',
            resolve: {
                "shop_product": function(shopFactory,$route){
                    return shopFactory.shop_products().query({shop_slug: $route.current.params.shop_slug, id: $route.current.params.id}).$promise
                }
            }
        });

}]);

angular.module('shopsModule').controller('shopShowController', ['$scope', 'shop', 'shopFactory', function($scope, shop, shopFactory ){
    var vm = this;
    vm.shop = shop.shop;
    shopFactory.shop_products().query({shop_slug: vm.shop.slug, id: null}).$promise.then(function(products){
        vm.products = products.products;
    });
}]);

angular.module('shopsModule').controller('shopProductShowController', ['$scope', 'shop_product',function($scope, shop_product ){
    var vm = this;
    vm.product = shop_product.product;
}]);
