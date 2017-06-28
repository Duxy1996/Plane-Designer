class AddPlaneExampleToEngine < ActiveRecord::Migration[5.0]
  def change
    add_column :engines, :plane, :string
  end
end
