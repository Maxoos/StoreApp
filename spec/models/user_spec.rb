require 'spec_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    FactoryGirl.create :user
  }

  describe "create" do
    it 'should create a shop' do
      expect(user.shop.class).to be Shop
    end
  end


end
