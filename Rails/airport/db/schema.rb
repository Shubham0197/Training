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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_082556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.text "name"
    t.integer "cruising_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifieds", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "aircraft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifieds_employees", id: false, force: :cascade do |t|
    t.bigint "certified_id", null: false
    t.bigint "employee_id", null: false
    t.index ["certified_id", "employee_id"], name: "index_certifieds_employees_on_certified_id_and_employee_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.integer "salary"
    t.string "mobile_number", limit: 12
    t.date "DOB", default: "1997-01-01"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count_of_pilots"
    t.index ["name"], name: "index_employees_on_name"
  end

  create_table "flights", force: :cascade do |t|
    t.text "from"
    t.text "destination"
    t.integer "distance"
    t.time "departs"
    t.time "arrives"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights_aircrafts", force: :cascade do |t|
    t.bigint "flight_id"
    t.bigint "aircraft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_id"], name: "index_flights_aircrafts_on_aircraft_id"
    t.index ["flight_id"], name: "index_flights_aircrafts_on_flight_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sku"
    t.index ["name"], name: "index_products_on_name"
  end

  add_foreign_key "certifieds", "aircrafts"
  add_foreign_key "certifieds", "employees"
end
