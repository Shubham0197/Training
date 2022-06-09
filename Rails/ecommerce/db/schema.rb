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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_101622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.float "description"
  end

  create_table "customers", force: :cascade do |t|
    t.text "name"
    t.string "mobile_number", default: "100000"
    t.bigint "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customrs", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.integer "email_address"
    t.date "DOB"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groceries", force: :cascade do |t|
    t.string "product"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", force: :cascade do |t|
    t.bigint "wallet_id"
    t.bigint "aadhar"
    t.text "pan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_identifications_on_wallet_id"
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "customer_id"
    t.float "amount"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "orderable_type"
    t.bigint "orderable_id"
    t.index ["orderable_type", "orderable_id"], name: "index_orders_on_orderable"
  end

  create_table "product_options", id: false, force: :cascade do |t|
    t.text "product_option"
    t.integer "product_id"
    t.index ["product_id"], name: "index_product_options_on_product_id", unique: true
    t.index ["product_option"], name: "index_product_options_on_product_option"
  end

  create_table "products", comment: "Products data", force: :cascade do |t|
    t.text "name"
    t.decimal "price", precision: 5, scale: 2, default: "100.0", comment: "Price column"
    t.integer "category_id"
    t.string "description"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.integer "lock_version", default: 0, null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customr_id"
    t.index ["customr_id"], name: "index_wallets_on_customr_id"
  end

end
