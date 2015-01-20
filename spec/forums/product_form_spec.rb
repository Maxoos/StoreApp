require 'spec_helper'

RSpec.describe ProductForm, :type => :model do

  let(:shop) { FactoryGirl.create(:shop) }
  let(:product_form) { ProductForm.new(:shop => shop) }
  let(:effect_forms) {[EffectForm.new(:name => "effect1"),EffectForm.new(:name => "effect2")]}

  describe "validations" do
    it 'should validate effects presence' do
      expect(product_form).to have(1).error_on(:effect_forms)
    end
  end

  describe "save" do

    before do
      product_form.name = "product 1"
      product_form.description = "product 1 desc"
      product_form.effect_forms = effect_forms
    end

    it "should create a new product" do
      product_form.save
      expect(shop.products[0]).to be product_form.product
    end

    it "should create effects" do
      product_form.save
      expect(shop.products[0].effects).to be product_form.effects
    end

  end

end
