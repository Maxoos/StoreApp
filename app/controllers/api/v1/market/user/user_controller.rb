module Api
  module V1
    module Market
      module User
        class UserController < MarketController
          before_action :verify_user_authenticity!

          def show
            render json: current_user
          end

          private

        end
      end
    end
  end
end