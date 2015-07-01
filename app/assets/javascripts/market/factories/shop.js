angular.module('market').factory('shopFactory', function($resource) {

    return {
        shop: function(){
            return $resource('/api/v1/market/shops/:shop_slug',{},
                {'query': {method: 'GET', isArray: false }});
        },
        shop_products: function(){
            return $resource('/api/v1/market/shops/:shop_slug/products/:id',
                {shop_slug:'@shop_slug',id:null},{'query': {method: 'GET', isArray: false }});
        }
    };
});

