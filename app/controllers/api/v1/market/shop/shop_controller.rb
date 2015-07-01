module Api
  module V1
    module Market
      module Shop
        class ShopController < MarketController
          helper_method :current_shop

          def show
            render json: current_shop
          end

          private

          # find current shop by shop_slug or raise 404
          def current_shop
            @shop ||= ::Shop.find_by_slug!(params[:shop_slug])
          end
        end
      end
    end
  end
end