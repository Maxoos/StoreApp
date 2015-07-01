require 'rails_helper'

RSpec.describe Shop, :type => :model do
  let(:shop) { FactoryGirl.create(:user).shop }

  describe "find_by_slug!" do
    it "should return a shop" do
      expect(Shop.find_by_slug!(shop.slug)).to eq shop
    end

    context "when shop not found" do
      it "should raise an exception" do
        expect{Shop.find_by_slug!("no-fear")}.to raise_error
      end
    end
  end
end
