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

ActiveRecord::Schema[7.0].define(version: 2024_01_31_052936) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_id"
    t.integer "sub_directory_id"
    t.integer "custom_order"
    t.index ["sub_directory_id"], name: "index_departments_on_sub_directory_id"
    t.index ["unit_id"], name: "index_departments_on_unit_id"
  end

  create_table "departments_sub_directories", id: false, force: :cascade do |t|
    t.integer "department_id"
    t.integer "sub_directory_id"
    t.index ["department_id", "sub_directory_id"], name: "index_dep_sub_dir_on_ids", unique: true
    t.index ["department_id"], name: "index_departments_sub_directories_on_department_id"
    t.index ["sub_directory_id"], name: "index_departments_sub_directories_on_sub_directory_id"
  end

  create_table "designations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "site_name"
    t.date "joining_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.integer "mobile1"
    t.integer "mobile2"
    t.string "landline_residential"
    t.string "landline_office_intercom"
    t.string "landline_office_direct"
    t.integer "designation_id"
    t.integer "position1_id"
    t.integer "position2_id"
    t.integer "sub_directory_id"
    t.integer "custom_order"
    t.index ["department_id"], name: "index_faculties_on_department_id"
    t.index ["designation_id"], name: "index_faculties_on_designation_id"
    t.index ["position1_id"], name: "index_faculties_on_position1_id"
    t.index ["position2_id"], name: "index_faculties_on_position2_id"
    t.index ["sub_directory_id"], name: "index_faculties_on_sub_directory_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_directories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_sub_directory"
    t.integer "custom_order"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "super_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_departments", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.index ["department_id"], name: "index_users_departments_on_department_id"
    t.index ["user_id", "department_id"], name: "index_user_dep_on_ids", unique: true
    t.index ["user_id"], name: "index_users_departments_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "departments", "sub_directories"
  add_foreign_key "departments", "units"
  add_foreign_key "faculties", "departments"
  add_foreign_key "faculties", "designations"
  add_foreign_key "faculties", "positions", column: "position1_id"
  add_foreign_key "faculties", "positions", column: "position2_id"
  add_foreign_key "faculties", "sub_directories"
end
