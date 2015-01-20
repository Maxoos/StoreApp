require 'spec_helper'

describe Api::V1::Market::Shop::ShopController do
 let!(:shop) {FactoryGirl.create(:user).shop}

 describe 'current_shop' do
   it 'should load shop from slug' do
     get :show, :shop_slug => shop.slug
     expect(controller.send(:current_shop)).to eq shop
   end
 end

  describe "show" do
    it 'should respond with shop json' do
      get :show, :shop_slug => shop.slug
      expect(response.body).to have_json_path("shop")
    end
    it 'should retrieve correct shop' do
      get :show, {:shop_slug => shop.slug}
      expect(parse_json(response.body)['shop']['id']).to eq shop.id
    end
  end
end