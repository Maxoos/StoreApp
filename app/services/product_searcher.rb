class ProductSearcher

  attr_accessor :properties

  def initialize params
    @categories = nil
    @shop = nil
    @properties = {}
    @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
    @properties[:per_page] = params[:per_page].to_i > 0 ? params[:per_page].to_i : per_page_default
    @properties[:categories_slug] = params[:categories]
    @properties[:shop_slug] = params[:shop_slug]
  end

  def query
    product_scope.offset(current_offset).limit(@properties[:per_page])
  end

  def self.search params
    self.new(params).query
  end

  private

  def product_scope
    product_scope = Product
    product_scope = product_scope.with_categories(categories) if categories.present?
    product_scope = product_scope.with_shop(shop.id) if shop
    product_scope
  end

  def categories
    @categories ||= Category.where(:slug => @properties[:categories_slug]) if @properties[:categories_slug]
  end

  def shop
    @shop ||= Shop.find_by_slug!(@properties[:shop_slug]) if @properties[:shop_slug]
  end

  def current_offset
    (@properties[:page] - 1) * @properties[:per_page]
  end

  def per_page_default
    15
  end

end