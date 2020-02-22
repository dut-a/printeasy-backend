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

ActiveRecord::Schema.define(version: 20200221214458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prints", force: :cascade do |t|
    t.string "print_type"
    t.integer "number_of_copies"
    t.integer "ordered_by"
    t.integer "fulfilled_by"
    t.string "payment_method"
    t.string "payment_status"
    t.string "pickup_location"
    t.string "pickup_type"
    t.string "delivery_address"
    t.string "placed_on"
    t.string "estimated_completion_time"
    t.string "status"
    t.integer "user_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_type"
    t.string "cost"
    t.string "time_to_complete"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "user_type"
    t.string "bio"
    t.string "picture"
    t.string "phone_number"
    t.string "email_address"
    t.string "physical_address"
    t.string "name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "fax_number"
    t.string "website"
    t.string "business_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
