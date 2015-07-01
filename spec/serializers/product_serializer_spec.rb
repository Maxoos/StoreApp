require 'rails_helper'

RSpec.describe ProductSerializer do
  let(:shop) { FactoryGirl.create(:user).shop }
  let!(:product){ FactoryGirl.create(:product) }
  before { shop.products << product }
  subject(:hash) { ProductSerializer.new(product).serializable_hash }

  it { hash[:id].should eq product.id }
  it { hash[:shop_name].should eql product.shop.name }

end
