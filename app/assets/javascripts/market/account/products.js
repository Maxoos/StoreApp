angular.module('accountModule', [], ['$routeProvider', function($routeProvider){

    $routeProvider.when('/account/products/new', {
        templateUrl:'account/products/new.html',
        controller:'accountProductsController',
        controllerAs: 'account_products'
    })
}]);

angular.module('accountModule').controller('accountProductsController', ['$scope', function($scope){
    var vm = this;
    vm.product = {};



}]);
