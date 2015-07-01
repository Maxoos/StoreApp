Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'api/v1/market/registrations' }


  resources :market

  root 'market#index'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      namespace :market do
        resources :products
        namespace :user, :module => 'user' do
            root :to => 'user#show'
        end
        namespace :shops, :module => 'shop' do
          scope ':shop_slug', :as => :shop do
            root :to => 'shop#show'
            resources :products
          end
        end
      end
    end
  end

  get '*any', :to => 'market#index'
  # get '/account/products/new2', :to => 'market#index'

end
