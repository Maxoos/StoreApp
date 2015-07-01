angular.module('market').factory('Account', function($resource) {
    return {
        products: function(){
            return $resource('/api/v1/market/user/products/:id',{},
                {'query': {method: 'GET', isArray: false }});
        }
    };
});

