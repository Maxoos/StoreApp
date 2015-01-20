require 'spec_helper'

describe Api::V1::Market::Shop::ProductsController do
  let!(:shop) { FactoryGirl.create(:user).shop }
  let!(:shop_products) { FactoryGirl.create_list :product, 30, {:shop => shop} }

  describe "index" do
    it 'should respond with products json' do
      get :index, {:shop_slug => shop.slug}
      expect(response.body).to have_json_path("products")
    end

    it 'should retrieve products for this shop' do
      get :index, {:shop_slug => shop.slug}
      expect(parse_json(response.body)['products'].first['id']).to eq shop_products.first.id
    end

  end

  describe "show" do
    let!(:product) {shop_products.first}

    it "should return a product" do
      get :show, {:shop_slug => shop.slug, :id => product.slug}
      expect(parse_json(response.body)['product']['id']).to eq product.id
    end

    context "when same product slug in two shops" do
      let(:other_shop) { FactoryGirl.create(:user).shop }
      before {
        # add a new product with same name to other_shop
        other_shop.products << FactoryGirl.create(:product,{:name => product.name})
      }

      it "should consider current_shop and return the correct product" do
        other_shop_product = other_shop.products.last
        get :show, {:shop_slug => other_shop.slug, :id => other_shop_product.slug}
        expect(parse_json(response.body)['product']['id']).to eq other_shop_product.id
      end

    end

  end
end