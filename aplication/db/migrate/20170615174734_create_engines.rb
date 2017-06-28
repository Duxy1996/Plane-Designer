class CreateEngines < ActiveRecord::Migration[5.0]
  def change
    create_table :engines do |t|
      t.string :name
      t.decimal :power
      t.decimal :fuel_consumption

      t.timestamps
    end
  end
end
