# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130720041858) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "competitions", :force => true do |t|
    t.integer "pilot_id"
    t.integer "tournament_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pilots", :force => true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.string   "name"
    t.string   "status",     :default => "not_approved"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "planes", :force => true do |t|
    t.integer  "pilot_id"
    t.string   "model"
    t.string   "frequency"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "rounds", :force => true do |t|
    t.integer "pilot_id"
    t.integer "tour_id"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "tours", :force => true do |t|
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "wstats", :force => true do |t|
    t.integer "pilot_id"
    t.integer "tour_id"
    t.integer "tournament_id"
    t.integer "seconds",            :default => 0
    t.integer "cuts",               :default => 0
    t.boolean "uncut"
    t.boolean "non_engagement"
    t.boolean "crossed_line"
    t.boolean "ground_start"
    t.boolean "landed"
    t.integer "ground_targets",     :default => 0
    t.boolean "cable_wires"
    t.boolean "guns"
    t.boolean "pilot_on_board"
    t.boolean "wing_structure"
    t.boolean "biplane"
    t.boolean "four_stroke_engine"
    t.integer "rpm"
    t.string  "prop_ratio"
    t.integer "judge_id"
  end

  create_table "wwstats", :force => true do |t|
    t.integer "pilot_id"
    t.integer "tour_id"
    t.integer "tournament_id"
    t.integer "seconds",        :default => 0
    t.integer "cuts",           :default => 0
    t.boolean "uncut"
    t.boolean "non_engagement"
    t.boolean "crossed_line"
    t.boolean "rpm_penalty"
  end

end
