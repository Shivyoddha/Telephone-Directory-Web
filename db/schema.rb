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

ActiveRecord::Schema[7.0].define(version: 2023_12_05_050236) do
  create_table "academic_backgrounds", force: :cascade do |t|
    t.string "degree"
    t.string "college"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_academic_backgrounds_on_faculty_id"
  end

  create_table "achievements", force: :cascade do |t|
    t.text "description"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_achievements_on_faculty_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "phoneno"
    t.string "email"
    t.string "telephone"
    t.string "site_name"
    t.date "joining_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.index ["department_id"], name: "index_faculties_on_department_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_interests_on_faculty_id"
  end

  create_table "publications", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_publications_on_faculty_id"
  end

  create_table "significant_projects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_significant_projects_on_faculty_id"
  end

  add_foreign_key "academic_backgrounds", "faculties"
  add_foreign_key "achievements", "faculties"
  add_foreign_key "faculties", "departments"
  add_foreign_key "interests", "faculties"
  add_foreign_key "publications", "faculties"
  add_foreign_key "significant_projects", "faculties"
end
