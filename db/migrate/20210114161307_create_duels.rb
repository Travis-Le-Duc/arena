class CreateDuels < ActiveRecord::Migration[6.0]
  def change
    create_table :duels do |t|
      t.references :winner, foreign_key: { to_table: :fighters }
      t.references :loser, foreign_key: { to_table: :fighters }
      t.text :logs

      t.timestamps
    end
  end
end
