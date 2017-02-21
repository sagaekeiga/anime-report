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

ActiveRecord::Schema.define(version: 20170221065255) do

  create_table "animes", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.text     "youtube"
    t.text     "fc2"
    t.text     "ani"
    t.text     "hima"
    t.text     "gogo"
    t.text     "nova"
    t.text     "gooda"
    t.text     "kiss"
    t.text     "myvi"
    t.text     "b9"
    t.text     "daily"
    t.text     "miomio"
    t.text     "smove"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "created_at"], name: "index_animes_on_title_and_created_at"
  end

  create_table "bots", force: :cascade do |t|
    t.text     "title"
    t.text     "url"
    t.text     "page_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "url", "page_id", "date"], name: "index_bots_on_title_and_url_and_page_id_and_date"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "name"
    t.text     "body"
    t.integer  "work_id"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.text     "title"
    t.text     "story"
    t.text     "broadcast"
    t.text     "youtube"
    t.text     "theme"
    t.text     "cast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.text     "youtube"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
