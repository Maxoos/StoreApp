class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.timestamps
      t.string  :type
      t.integer :attachable_id
      t.string  :attachable_type
    end
    add_attachment :assets, :attachment
  end
end
