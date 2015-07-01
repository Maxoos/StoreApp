class AddPositionToEffect < ActiveRecord::Migration
  def change
    add_column :effects, :position, :integer
  end
end
