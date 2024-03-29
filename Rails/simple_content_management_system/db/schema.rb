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

ActiveRecord::Schema[7.0].define(version: 2020_08_21_200512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments_users", id: false, force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "user_id", null: false
    t.index ["department_id", "user_id"], name: "index_departments_users_on_department_id_and_user_id"
    t.index ["user_id", "department_id"], name: "index_departments_users_on_user_id_and_department_id"
  end

  create_table "page_assignments", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.bigint "user_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id", "user_id"], name: "index_page_assignments_on_page_id_and_user_id"
    t.index ["page_id"], name: "index_page_assignments_on_page_id"
    t.index ["user_id", "page_id"], name: "index_page_assignments_on_user_id_and_page_id"
    t.index ["user_id"], name: "index_page_assignments_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "subject_id"
    t.string "name"
    t.string "permalink"
    t.integer "position"
    t.boolean "visible"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_pages_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "page_assignments", "pages"
  add_foreign_key "page_assignments", "users"
end
