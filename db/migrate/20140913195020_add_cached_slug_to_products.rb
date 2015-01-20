class AddCachedSlugToProducts < ActiveRecord::Migration
  
  def self.up
    add_column :products, :slug, :string
    add_index  :products, :slug
  end

  def self.down
    remove_column :products, :slug
  end
  
end
