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

ActiveRecord::Schema.define(version: 20171114171842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bollywoods", force: :cascade do |t|
    t.string "content"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "option_c", default: ""
    t.string "option_d", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boolean_quizzes", force: :cascade do |t|
    t.string "content"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cricket_quizzes", force: :cascade do |t|
    t.string "content"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "option_c", default: ""
    t.string "option_d", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_booleans", force: :cascade do |t|
    t.string "content"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_quizzes", force: :cascade do |t|
    t.string "content"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "user_id"
    t.string "reffer_number", null: false
    t.boolean "invitation_accept", default: false
    t.datetime "invitation_accepted_at"
    t.string "invitation_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_quizzes", force: :cascade do |t|
    t.string "content"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 4, scale: 2
    t.integer "user_id"
    t.boolean "payment_mode"
    t.string "bank_name", default: ""
    t.string "ac_number", default: ""
    t.string "ifsc_number", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "content"
    t.string "option_a", default: ""
    t.string "option_b", default: ""
    t.string "option_c", default: ""
    t.string "option_d", default: ""
    t.string "answer", null: false
    t.date "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swipe_insta", force: :cascade do |t|
    t.date "added_date"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swipe_ones", force: :cascade do |t|
    t.date "added_date"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swipe_quizzes", force: :cascade do |t|
    t.date "added_date"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.integer "coins"
    t.string "contact_number", null: false
    t.string "access_token", limit: 32
    t.string "mobile_otp"
    t.boolean "disabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gems", default: 0
    t.string "reffer_number", default: ""
  end

end
