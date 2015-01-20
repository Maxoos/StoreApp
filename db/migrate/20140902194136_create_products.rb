class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :shop, index: true

      t.timestamps
    end

    create_table :categories_products, id: false do |t|
      t.belongs_to :product
      t.belongs_to :category
    end
  end
end
