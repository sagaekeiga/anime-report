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

ActiveRecord::Schema.define(version: 20170304154339) do

  create_table "animes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",      limit: 65535
    t.text     "youtube",    limit: 65535
    t.text     "fc2",        limit: 65535
    t.text     "ani",        limit: 65535
    t.text     "hima",       limit: 65535
    t.text     "gogo",       limit: 65535
    t.text     "nova",       limit: 65535
    t.text     "gooda",      limit: 65535
    t.text     "kiss",       limit: 65535
    t.text     "myvi",       limit: 65535
    t.text     "b9",         limit: 65535
    t.text     "daily",      limit: 65535
    t.text     "miomio",     limit: 65535
    t.text     "smove",      limit: 65535
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["created_at"], name: "index_animes_on_created_at", using: :btree
  end

  create_table "bots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",      limit: 65535
    t.text     "url",        limit: 65535
    t.text     "page_id",    limit: 65535
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535
    t.text     "body",       limit: 65535
    t.integer  "work_id"
    t.integer  "content_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",      limit: 65535
    t.text     "story",      limit: 65535
    t.text     "broadcast",  limit: 65535
    t.text     "youtube",    limit: 65535
    t.text     "theme",      limit: 65535
    t.text     "cast",       limit: 65535
    t.text     "url",        limit: 65535
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tweets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "works", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "main_title", limit: 65535
    t.text     "sub_title",  limit: 65535
    t.text     "content",    limit: 65535
    t.text     "youtube",    limit: 65535
    t.date     "date"
    t.integer  "rank"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
