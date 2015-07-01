module Api
  module V1
    module Market
      class RegistrationsController < Devise::RegistrationsController

        private

        def sign_up_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :user_name)
        end

        def account_update_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :user_name, :current_password)
        end
      end
    end
  end
end
