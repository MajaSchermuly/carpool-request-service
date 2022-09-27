# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_919_024_727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admins', primary_key: 'admin_id', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'car_rides', primary_key: 'car_ride_id', force: :cascade do |t|
    t.integer 'request_id'
    t.integer 'driver_id'
    t.integer 'queue_pos'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'drivers', primary_key: 'driver_id', force: :cascade do |t|
    t.string 'phone_number'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'car_model'
    t.datetime 'check_in_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'emergency_contacts', primary_key: 'emergency_contact_id', force: :cascade do |t|
    t.string 'phone_number'
    t.string 'full_name'
    t.string 'relation'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'members', primary_key: 'member_id', force: :cascade do |t|
    t.integer 'driver_id'
    t.string 'username'
    t.string 'password'
    t.decimal 'leaderboard_points'
    t.integer 'emergency_contact_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'requests', primary_key: 'request_id', force: :cascade do |t|
    t.integer 'rider_id'
    t.datetime 'date'
    t.string 'pick_up_loc'
    t.string 'drop_off_loc'
    t.integer 'num_passengers'
    t.string 'attire'
    t.string 'additional_info'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end


  create_table "members", primary_key: "member_id", force: :cascade do |t|
    t.boolean "is_admin"
    t.boolean "is_supervisor"
    t.decimal "leaderboard_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "requests", primary_key: "request_id", force: :cascade do |t|
    t.integer "rider_id"
    t.string "request_status"
    t.datetime "date_time"
    t.string "pick_up_loc"
    t.boolean "is_address_BCS"
    t.string "drop_off_loc"
    t.integer "num_passengers"
    t.string "additional_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
