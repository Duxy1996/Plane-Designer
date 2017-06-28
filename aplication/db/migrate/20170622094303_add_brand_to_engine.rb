class AddBrandToEngine < ActiveRecord::Migration[5.0]
  def change
    add_column :engines, :brand, :string
  end
end
