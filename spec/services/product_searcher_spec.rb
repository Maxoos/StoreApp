require 'spec_helper'

RSpec.describe ProductSearcher do
  let!(:shop) {FactoryGirl.create(:user).shop}
  let!(:category_one) {FactoryGirl.create :category}
  let!(:category_two) {FactoryGirl.create :category}
  let!(:products_category_one) { FactoryGirl.create_list :product, 10, :categories => [category_one], :shop => shop }
  let!(:products_category_two) { FactoryGirl.create_list :product, 15, :categories => [category_two] }

  describe "initialize" do
    before{ProductSearcher.stub(:per_page_default).and_return(15)}

    context "defaults" do
      it{expect(ProductSearcher.new({}).properties[:per_page]).to eq 15}
      it{expect(ProductSearcher.new({}).properties[:page]).to eq 1}
      it{expect(ProductSearcher.new({:per_page => -15}).properties[:per_page]).to eq 15}
      it{expect(ProductSearcher.new({:per_page => -15}).properties[:per_page]).to eq 15}
    end

    context "when invalid values set defaults" do
      it{expect(ProductSearcher.new({:per_page => "five"}).properties[:per_page]).to eq 15}
      it{expect(ProductSearcher.new({:page => "page_one"}).properties[:page]).to eq 1}
    end

  end

  it 'should retrieve products per category slug' do
    params = {}
    params[:categories] = [category_one.slug]
    expect(ProductSearcher.search(params)).to eq products_category_one
  end

  it 'should retrieve products per shop slug' do
    expect(ProductSearcher.search({:shop_slug => shop.slug})).to eq products_category_one
  end

  it 'should raise an error if shop not found' do
    expect{ProductSearcher.search({:shop_slug => "no_fear"})}.to raise_error
  end

  describe "paginate" do

    it { expect(ProductSearcher.search({:per_page => 15,:page => 1}).count).to eq 15 }
    it { expect(ProductSearcher.search({:per_page => 15,:page => 2}).count).to eq 10 }

    context "page param" do
      it "should set offset" do
        expect(ProductSearcher.search({:per_page => 15,:page => 2}).values[:offset]).to eq 15
      end
    end

    context "per_page param" do
      it "should set limit" do
        expect(ProductSearcher.search({:per_page => 5,:page => 1}).values[:limit]).to eq 5
      end
    end

  end
end
