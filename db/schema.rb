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

ActiveRecord::Schema.define(version: 2021_06_01_101143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "rectorat_id", null: false
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["classroom_id"], name: "index_assignments_on_classroom_id"
    t.index ["rectorat_id"], name: "index_assignments_on_rectorat_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "level"
    t.index ["school_id"], name: "index_classrooms_on_school_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "rectorats", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "classroom_id"
    t.bigint "user_id"
    t.index ["classroom_id"], name: "index_reviews_on_classroom_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "school_users", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.boolean "attachment", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["school_id"], name: "index_school_users_on_school_id"
    t.index ["user_id"], name: "index_school_users_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "specification"
    t.bigint "director_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.index ["director_id"], name: "index_schools_on_director_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.boolean "availability"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "classrooms"
  add_foreign_key "assignments", "rectorats"
  add_foreign_key "classrooms", "schools"
  add_foreign_key "school_users", "schools"
  add_foreign_key "schools", "directors"
end
