require 'spec_helper'

describe Api::V1::Market::ProductsController do
  let(:shop) {FactoryGirl.create(:user).shop}
  let!(:products) { FactoryGirl.create_list(:product, 30, {:shop => shop})}

  describe "index" do

    it 'should respond with products json' do
      get :index
      expect(response.body).to have_json_path("products")
    end

    context "categories" do
      let!(:category_one) {FactoryGirl.create :category, {:name => "category one"}}
      let!(:product_with_category){
        FactoryGirl.create(:product, {:name => "a product", :categories => [category_one], :shop => shop})
      }

      it "should be accepted" do
        get :index, {:categories => category_one.slug}
        expect(parse_json(response.body)['products'].count).to eq 1
      end
    end
  end
end