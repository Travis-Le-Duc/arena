class CreateDuelEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :duel_equipments do |t|
      t.references :duel, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
