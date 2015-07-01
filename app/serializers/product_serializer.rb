class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :description, :shop_name, :shop_slug

end
