class Product < ActiveRecord::Base

  belongs_to :shop
  has_many :effects, :dependent => :destroy
  has_and_belongs_to_many :categories

  is_sluggable :name, :history => false, :slug_column => :slug

  scope :with_categories, ->(categories = nil){ includes(:categories).where('categories.id' => categories)}
  scope :with_shop, ->(shop_id = nil){ where(:shop_id => shop_id) }

  # shop_name, shop_slug
  delegate :name, :slug, :to => :shop, :prefix => true

  # maxoos
  # This method monkey patches the generate_slug method of the slugged gem to include Shop scope.
  # This will allow uniq slug per shop and not for the whole product model.
  # Users will be able to create products like this:
  # /creativedo/lightroom_skin
  # /betoimages/lightroom_skin
  def generate_slug
    slug_value = self.class.slug_value_for(send(self.slug_source))
    if slug_value.present?
      scope = self.class.other_than(self).slug_scope_relation(self).where(:shop_id => self.shop_id)
      slug_value = Slugged.next_value(scope, slug_value)
      write_attribute self.cached_slug_column, slug_value
    elsif self.default_uuid_slug
      write_attribute self.cached_slug_column, Slugged.generate_uuid_slug
    else
      write_attribute self.cached_slug_column, nil
    end
  end

end
