require 'spec_helper'

RSpec.describe ProductSerializer do
  let(:product) { FactoryGirl.create :product }
  subject(:hash) { ProductSerializer.new(product).serializable_hash }

  it { hash[:id].should eq product.id }
  it { hash[:shop][:id].should eql product.shop.id }

end
