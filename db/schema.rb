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

ActiveRecord::Schema[7.1].define(version: 2024_09_13_125601) do
  create_table "base_cocktails", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "base_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cocktail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_bookmarks_on_cocktail_id"
    t.index ["user_id", "cocktail_id"], name: "index_bookmarks_on_user_id_and_cocktail_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category_type", null: false
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cocktail_tastings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tasting_recipe"
    t.string "cocktail_flavor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cocktail_id"
    t.bigint "whiskey_id", null: false
    t.bigint "user_id"
    t.index ["cocktail_id"], name: "index_cocktail_tastings_on_cocktail_id"
    t.index ["user_id"], name: "index_cocktail_tastings_on_user_id"
    t.index ["whiskey_id"], name: "index_cocktail_tastings_on_whiskey_id"
  end

  create_table "cocktails", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cocktail_name"
    t.text "cocktail_create"
    t.text "cocktail_origin"
    t.text "cocktail_recipe"
    t.text "cocktail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "base_cocktail_id", null: false
    t.index ["base_cocktail_id"], name: "index_cocktails_on_base_cocktail_id"
  end

  create_table "distilleries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "distillery_name"
    t.string "distillery_url"
    t.string "prefectures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id", null: false
    t.index ["region_id"], name: "index_distilleries_on_region_id"
  end

  create_table "regions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "region_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remmaining_quantities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quantity"
    t.string "quantity_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tasting_text"
    t.string "tasting_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "whiskey_id", null: false
    t.decimal "aroma", precision: 10
    t.decimal "flavor", precision: 10
    t.decimal "body", precision: 10
    t.decimal "finish", precision: 10
    t.decimal "balance", precision: 10
    t.index ["whiskey_id"], name: "index_tastings_on_whiskey_id"
  end

  create_table "user_providers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "whiskey_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "whiskey_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_whiskey_categories_on_category_id"
    t.index ["whiskey_id"], name: "index_whiskey_categories_on_whiskey_id"
  end

  create_table "whiskeys", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "remmaining_quantity_id"
    t.index ["remmaining_quantity_id"], name: "index_whiskeys_on_remmaining_quantity_id"
    t.index ["user_id"], name: "index_whiskeys_on_user_id"
  end

  add_foreign_key "cocktail_tastings", "cocktails"
  add_foreign_key "cocktail_tastings", "users"
  add_foreign_key "cocktail_tastings", "whiskeys"
  add_foreign_key "distilleries", "regions"
  add_foreign_key "tastings", "whiskeys"
  add_foreign_key "user_providers", "users"
  add_foreign_key "whiskey_categories", "categories"
  add_foreign_key "whiskey_categories", "whiskeys"
  add_foreign_key "whiskeys", "remmaining_quantities"
  add_foreign_key "whiskeys", "users"
end
