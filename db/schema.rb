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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140111040607) do

  create_table "games", force: true do |t|
    t.integer  "num_players", default: 4, null: false
    t.integer  "num_teams",   default: 2, null: false
    t.text     "stats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "user_id",    default: 0, null: false
    t.integer  "team_id",    default: 0, null: false
    t.integer  "points",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.integer  "game_id",                 default: 0,   null: false
    t.string   "color",       limit: 100, default: "",  null: false
    t.integer  "num_players",             default: 2,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "score",                   default: "0", null: false
  end

  add_index "teams", ["game_id"], name: "index_teams_on_game_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                               null: false
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
