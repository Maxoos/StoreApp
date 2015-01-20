module Api
  module V1
    module Market
      module Shop
        class ProductsController < ShopController
          def index
            @products = ProductSearcher.search(params)
            render json: @products
          end

          def show
            @product = current_shop.products.find_by_slug!(params[:id])
            render json: @product
          end
        end
      end
    end
  end
end