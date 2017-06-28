class AddMassToEngine < ActiveRecord::Migration[5.0]
  def change
    add_column :engines, :mass, :decimal
  end
end
