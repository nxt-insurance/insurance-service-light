# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_01_172026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "insurances", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "product_generation_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at"
    t.jsonb "configuration", default: {}, null: false
    t.decimal "gross_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_generation_id"], name: "index_insurances_on_product_generation_id"
    t.index ["user_id"], name: "index_insurances_on_user_id"
  end

  create_table "product_generations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "product_id", null: false
    t.string "key"
    t.jsonb "configuration_schema", default: {}, null: false
    t.string "price_calculator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_product_generations_on_key"
    t.index ["product_id"], name: "index_product_generations_on_product_id"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_products_on_key"
  end

  add_foreign_key "insurances", "product_generations"
  add_foreign_key "product_generations", "products"
end
