class CreatePlanes < ActiveRecord::Migration[5.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.decimal :mass
      t.decimal :budget
      t.integer :category_id
      t.integer :user_id
      t.decimal :wing_surface
      t.integer :lift

      t.timestamps
    end
  end
end
