# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_16_125634) do

  create_table "duels", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.text "logs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loser_id"], name: "index_duels_on_loser_id"
    t.index ["winner_id"], name: "index_duels_on_winner_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.integer "force"
    t.integer "protection"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fighter_equipments", force: :cascade do |t|
    t.integer "fighter_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_fighter_equipments_on_equipment_id"
    t.index ["fighter_id"], name: "index_fighter_equipments_on_fighter_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "attack"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "duels", "fighters", column: "loser_id"
  add_foreign_key "duels", "fighters", column: "winner_id"
  add_foreign_key "fighter_equipments", "equipment"
  add_foreign_key "fighter_equipments", "fighters"
end
