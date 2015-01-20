class ProductForm
  include ActiveModel::Model
  attr_reader :product, :effects
  attr_accessor :shop, :name, :description, :effect_forms

  validates_presence_of :name, :description, :effect_forms

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  private

  def persist!
    @product = shop.products.create!(:name => name, :description => description)
    effect_forms.each do |effect|
      @product.effects << Effect.create(:name => effect.name)
    end
    @product.save!
    @effects = @product.effects
  end



end