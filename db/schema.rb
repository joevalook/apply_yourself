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

ActiveRecord::Schema.define(version: 2022_03_19_204930) do

  create_table "apps", force: :cascade do |t|
    t.string "job_title"
    t.string "resume"
    t.string "cover_letter"
    t.string "project"
    t.string "project_deadline"
    t.date "application_deadline"
    t.date "applied_date"
    t.string "application_status"
    t.integer "company_id"
    t.integer "user_id"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_apps_on_company_id"
    t.index ["user_id"], name: "index_apps_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "website"
    t.text "company_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "interview_number"
    t.date "interview_date"
    t.integer "app_id"
    t.string "interview_type"
    t.text "interview_notes"
    t.boolean "thank_you"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_interviews_on_app_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "apps", "companies", on_delete: :cascade
  add_foreign_key "apps", "users", on_delete: :cascade
  add_foreign_key "interviews", "apps", on_delete: :cascade
end
