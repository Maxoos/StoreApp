class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_one :user
  has_many :products
end
