class AddEtopsToEngine < ActiveRecord::Migration[5.0]
  def change
    add_column :engines, :etops, :integer
  end
end
