angular.module('market').factory('productFactory', function($resource) {
    var resource = $resource('/api/v1/market/products/:id',{},
                   {'query': {method: 'GET', isArray: false }});

    return {
        products: function(categories){
            return resource.query({categories: categories});
        }
    };
});

