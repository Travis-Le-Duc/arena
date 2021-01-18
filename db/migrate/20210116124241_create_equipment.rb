class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :force, default: 0
      t.integer :protection, default: 0

      t.timestamps
    end
  end
end
