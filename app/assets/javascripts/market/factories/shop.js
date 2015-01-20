angular.module('market').factory('shopFactory', function($resource) {
    var shopResource = $resource('/api/v1/market/shops/:id',{},
        {'query': {method: 'GET', isArray: false }});
    var shopProductsResource = $resource('/api/v1/market/shops/:shop_slug/products/:id',{},
        {'query': {method: 'GET', isArray: false }});

    return {
        shop: function(shop_slug){
            return shopResource.query({shop_slug: shop_slug});
        },
        shop_product: function(shop_slug,id){
            return shopProductsResource.query({shop_slug: shop_slug,id: id})
        }
    };
});

