require 'spec_helper'

RSpec.describe ShopSerializer do
  let(:shop) { FactoryGirl.create :shop }
  subject(:hash) { ShopSerializer.new(shop).serializable_hash }

  it { hash[:id].should eq shop.id }
  it { hash[:user][:id].should eql shop.user.id }

end
