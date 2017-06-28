class CreateGears < ActiveRecord::Migration[5.0]
  def change
    create_table :gears do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
