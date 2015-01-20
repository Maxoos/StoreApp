require 'spec_helper'

RSpec.describe Product, :type => :model do
  let!(:product){ FactoryGirl.create :product }

  describe "generate_slug" do
    context "when slug already exists" do
      let!(:_product){ FactoryGirl.create(:product,{:name => product.name}) }

      it "should create a valid product" do
        expect(_product.valid?).to be true
      end

      it "should generate a different slug" do
        expect(_product.slug).not_to eq(product.slug)
      end

    end

    context "when slug exists on an other shop" do
      let(:other_shop) { FactoryGirl.create(:user).shop }
      let(:current_shop) { FactoryGirl.create(:user).shop }
      before {
        # add product to other shop
        other_shop.products << product
        # add a new product with same name to current shop
        current_shop.products << FactoryGirl.create(:product,{:name => product.name})
      }

      it "should generate same slug on current shop" do
        expect(current_shop.products.first.slug).to eq other_shop.products.first.slug
      end
    end

  end
end
