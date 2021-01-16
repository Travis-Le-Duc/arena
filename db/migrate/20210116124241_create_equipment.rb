class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :force
      t.integer :protection

      t.timestamps
    end
  end
end
