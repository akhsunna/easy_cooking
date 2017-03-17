# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170317211830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "categories_dishes", id: false, force: :cascade do |t|
    t.integer "dish_id",     null: false
    t.integer "category_id", null: false
    t.index ["dish_id", "category_id"], name: "dish_category", unique: true, using: :btree
  end

  create_table "dish_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
    t.float   "quantity",      default: 1.0, null: false
    t.string  "unit"
    t.index ["dish_id"], name: "index_dish_ingredients_on_dish_id", using: :btree
    t.index ["ingredient_id"], name: "index_dish_ingredients_on_ingredient_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "instructions",                   null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cooking_time"
    t.integer  "calories"
    t.integer  "difficulty_level",   default: 1
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "dish_ingredients", "dishes"
  add_foreign_key "dish_ingredients", "ingredients"
end
