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

ActiveRecord::Schema.define(version: 20_221_102_001_807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'assignments', primary_key: 'assignment_id', force: :cascade do |t|
    t.integer 'member_id'
    t.integer 'request_id'
    t.integer 'car_id'
    t.datetime 'drop_off_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'cars', primary_key: 'car_id', force: :cascade do |t|
    t.string 'make'
    t.string 'model'
    t.string 'color'
    t.string 'plate_number'
    t.date 'registration_expiry'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'drivers', primary_key: 'driver_id', force: :cascade do |t|
    t.integer 'member_id'
    t.integer 'car_id'
    t.datetime 'check_in_time'
    t.string 'driver_status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'members', primary_key: 'member_id', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
    t.string 'address'
    t.boolean 'is_admin', default: false
    t.boolean 'is_supervisor', default: false
    t.decimal 'leaderboard_points'
    t.boolean 'created_password', default: true
    t.string 'emergency_full_name'
    t.string 'emergency_phone_number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'full_name'
    t.string 'uid'
    t.string 'avatar_url'
    t.string 'provider'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_members_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_members_on_reset_password_token', unique: true
  end

  create_table 'requests', primary_key: 'request_id', force: :cascade do |t|
    t.string 'name'
    t.string 'phone_number'
    t.string 'request_status'
    t.string 'pick_up_loc'
    t.string 'drop_off_loc'
    t.integer 'num_passengers'
    t.string 'additional_info'
    t.integer 'queue_pos'
    t.datetime 'time_cancelled'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'whitelists', primary_key: 'whitelist_id', force: :cascade do |t|
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
