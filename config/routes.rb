Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'api/v1/market/registrations' }


  resources :market

  root 'market#index'

  namespace :api do
    namespace :v1 do
      namespace :market do
        resources :products
        namespace :shops, :module => 'shop' do
          scope ':shop_slug', :as => :shop do
            root :to => 'shop#show'
            resources :products
          end
        end
      end
    end
  end

  resources '*category', :only => [:index,:show], :controller => "market"

end
