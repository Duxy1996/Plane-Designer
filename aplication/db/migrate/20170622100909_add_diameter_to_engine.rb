class AddDiameterToEngine < ActiveRecord::Migration[5.0]
  def change
    add_column :engines, :diameter, :decimal
  end
end
