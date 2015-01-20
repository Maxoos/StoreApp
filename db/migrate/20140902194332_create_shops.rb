class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
