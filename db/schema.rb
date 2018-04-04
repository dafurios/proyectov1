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

ActiveRecord::Schema.define(version: 20180404183101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.string "type_car"
    t.string "brand"
    t.string "model"
    t.string "year"
    t.string "color"
    t.string "plate"
    t.boolean "tech_rev", default: false
    t.boolean "nation_registry", default: false
    t.string "school"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_communes_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "short_name"
    t.string "name"
    t.string "code"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "r_legal"
    t.string "rut_legal"
    t.string "address"
    t.string "rbd"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_schools_on_commune_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "image"
    t.string "rut"
    t.string "name"
    t.string "lastname"
    t.string "surname"
    t.string "address"
    t.string "commune"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "school"
    t.string "level"
    t.string "course"
    t.bigint "user_id"
    t.bigint "commune_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_students_on_commune_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "student"
    t.string "car"
    t.string "driver"
    t.float "start_longitude"
    t.float "start_latitude"
    t.float "end_longitude"
    t.float "end_latitude"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
    t.string "surname"
    t.string "rut"
    t.string "relationship"
    t.string "r_legal"
    t.string "rut_legal"
    t.string "giro"
    t.string "phone"
    t.string "school"
    t.string "level"
    t.string "course"
    t.string "coordinator"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "commune"
    t.string "state"
    t.string "city"
    t.string "country"
    t.boolean "work_child", default: false
    t.integer "role", default: 0
    t.string "driver"
    t.string "type_driver_license"
    t.string "info_emergency"
    t.string "type"
    t.string "image"
    t.bigint "enterprise_id"
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.bigint "coordinator_id"
    t.bigint "driver_id"
    t.bigint "school_id"
    t.bigint "commune_id"
    t.index ["commune_id"], name: "index_users_on_commune_id"
    t.index ["coordinator_id"], name: "index_users_on_coordinator_id"
    t.index ["driver_id"], name: "index_users_on_driver_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["enterprise_id"], name: "index_users_on_enterprise_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
    t.index ["student_id"], name: "index_users_on_student_id"
    t.index ["tutor_id"], name: "index_users_on_tutor_id"
  end

  add_foreign_key "cars", "users"
  add_foreign_key "communes", "regions"
  add_foreign_key "regions", "countries"
  add_foreign_key "schools", "communes"
  add_foreign_key "students", "communes"
  add_foreign_key "students", "schools"
  add_foreign_key "students", "users"
  add_foreign_key "users", "communes"
  add_foreign_key "users", "schools"
end
