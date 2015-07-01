angular.module('market').factory('productFactory', function($resource) {
    return {
        products: function(){
            return $resource('/api/v1/market/products/:id',{},
                {'query': {method: 'GET', isArray: false }});
        }
    };
});

