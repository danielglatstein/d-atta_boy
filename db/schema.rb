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

ActiveRecord::Schema.define(version: 20151113183533) do

  create_table "at_bats", force: :cascade do |t|
    t.integer  "inning_id"
    t.integer  "pitcher_id"
    t.integer  "batter_id"
    t.integer  "outs"
    t.string   "stand"
    t.string   "event"
    t.integer  "home_team_runs"
    t.integer  "away_team_runs"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "baserunners", force: :cascade do |t|
    t.integer  "pitch_id"
    t.integer  "on_1b"
    t.integer  "on_2b"
    t.integer  "on_3b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_teams", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.string   "away_team"
    t.string   "home_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "innings", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "number"
    t.string   "away_team"
    t.string   "home_team"
    t.string   "next_inning"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "innings_players", force: :cascade do |t|
    t.integer "inning_id"
    t.integer "player_id"
  end

  create_table "movements", force: :cascade do |t|
    t.integer  "pitch_id"
    t.float    "pfx_x"
    t.float    "pfx_z"
    t.float    "break_angle"
    t.float    "break_length"
    t.float    "spin_rate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.integer  "at_bat_id"
    t.string   "result"
    t.string   "pitch_type"
    t.integer  "nasty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "first"
    t.string   "last"
    t.string   "num"
    t.string   "rl"
    t.string   "bats"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_teams", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_points", force: :cascade do |t|
    t.integer  "pitch_id"
    t.float    "x0"
    t.float    "z0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strike_zones", force: :cascade do |t|
    t.integer  "pitch_id"
    t.float    "x"
    t.float    "y"
    t.float    "px"
    t.float    "pz"
    t.float    "sz_top"
    t.float    "sz_bot"
    t.integer  "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "name_full"
    t.string   "name_brief"
    t.string   "name"
    t.string   "code"
    t.string   "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "velocities", force: :cascade do |t|
    t.integer  "pitch_id"
    t.float    "start_speed"
    t.float    "end_speed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
