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

ActiveRecord::Schema.define(version: 2021_03_07_141842) do

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "due_date"
    t.integer "status_id"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assigned_user_id"
    t.index ["assigned_user_id"], name: "index_tickets_on_assigned_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "send_due_date_reminder"
    t.integer "due_date_reminder_interval"
    t.time "due_date_reminder_time"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
