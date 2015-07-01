class Category < ActiveRecord::Base
  has_ancestry
  is_sluggable :name, :history => false, :slug_column => :slug

  has_and_belongs_to_many :products
end
