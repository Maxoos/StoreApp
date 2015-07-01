class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string :name
      t.integer :product_id
      t.timestamps
    end
  end
end
