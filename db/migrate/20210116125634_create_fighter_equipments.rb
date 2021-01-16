class CreateFighterEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :fighter_equipments do |t|
      t.references :fighter, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
