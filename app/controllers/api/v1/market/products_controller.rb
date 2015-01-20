module Api
  module V1
    module Market
      class ProductsController < MarketController
        def index
          @products = ProductSearcher.search(params)
          render json: @products
        end
      end
    end
  end
end