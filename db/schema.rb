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

  create_table "duel_equipments", force: :cascade do |t|
    t.integer "duel_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duel_id"], name: "index_duel_equipments_on_duel_id"
    t.index ["equipment_id"], name: "index_duel_equipments_on_equipment_id"
  end

  create_table "duels", force: :cascade do |t|
    t.integer "fighter1_id"
    t.integer "fighter2_id"
    t.integer "winner_id"
    t.text "logs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fighter1_id"], name: "index_duels_on_fighter1_id"
    t.index ["fighter2_id"], name: "index_duels_on_fighter2_id"
    t.index ["winner_id"], name: "index_duels_on_winner_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.integer "force", default: 0
    t.integer "protection", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "attack"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "duel_equipments", "duels"
  add_foreign_key "duel_equipments", "equipment"
  add_foreign_key "duels", "fighters", column: "fighter1_id"
  add_foreign_key "duels", "fighters", column: "fighter2_id"
  add_foreign_key "duels", "fighters", column: "winner_id"
end
