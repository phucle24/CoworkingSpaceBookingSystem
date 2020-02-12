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

ActiveRecord::Schema.define(version: 2020_02_05_005218) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venues_id"
    t.index ["venues_id"], name: "index_amenities_on_venues_id"
  end

  create_table "booking_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time_use_start"
    t.datetime "time_use_close"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "spaces_id"
    t.bigint "users_id"
    t.bigint "payments_id"
    t.index ["payments_id"], name: "index_booking_details_on_payments_id"
    t.index ["spaces_id"], name: "index_booking_details_on_spaces_id"
    t.index ["users_id"], name: "index_booking_details_on_users_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_messages_on_users_id"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "method"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "space_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "per_month", precision: 10
    t.decimal "per_day", precision: 10
    t.decimal "per_hour", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.text "description"
    t.time "hour_open"
    t.time "hour_close"
    t.string "time_use_start"
    t.string "time_use_close"
    t.boolean "status"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venues_id"
    t.bigint "manager_id"
    t.bigint "types_id"
    t.bigint "space_prices_id"
    t.index ["manager_id"], name: "index_spaces_on_manager_id"
    t.index ["space_prices_id"], name: "index_spaces_on_space_prices_id"
    t.index ["types_id"], name: "index_spaces_on_types_id"
    t.index ["venues_id"], name: "index_spaces_on_venues_id"
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_roles_id"
    t.index ["user_roles_id"], name: "index_users_on_user_roles_id"
  end

  create_table "venues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "belongs_to_user_id"
    t.bigint "addresses_id"
    t.index ["addresses_id"], name: "index_venues_on_addresses_id"
    t.index ["belongs_to_user_id"], name: "index_venues_on_belongs_to_user_id"
  end

  add_foreign_key "amenities", "venues", column: "venues_id"
  add_foreign_key "booking_details", "payments", column: "payments_id"
  add_foreign_key "booking_details", "spaces", column: "spaces_id"
  add_foreign_key "booking_details", "users", column: "users_id"
  add_foreign_key "messages", "users", column: "users_id"
  add_foreign_key "spaces", "space_prices", column: "space_prices_id"
  add_foreign_key "spaces", "types", column: "types_id"
  add_foreign_key "spaces", "users", column: "manager_id"
  add_foreign_key "spaces", "venues", column: "venues_id"
  add_foreign_key "users", "user_roles", column: "user_roles_id"
  add_foreign_key "venues", "addresses", column: "addresses_id"
  add_foreign_key "venues", "users", column: "belongs_to_user_id"
end
