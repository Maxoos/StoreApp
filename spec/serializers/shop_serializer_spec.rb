require 'rails_helper'

RSpec.describe ShopSerializer do
  let(:shop) { FactoryGirl.create(:user).shop }
  subject(:hash) { ShopSerializer.new(shop).serializable_hash }

  it { hash[:id].should eq shop.id }
  it { hash[:user][:id].should eql shop.user.id }

end
