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

ActiveRecord::Schema.define(version: 20140920180651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bible_books", force: true do |t|
    t.string   "book"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
  end

  create_table "bible_chapters", force: true do |t|
    t.integer  "chapters"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bible_books_id"
  end

  add_index "bible_chapters", ["bible_books_id"], name: "index_bible_chapters_on_bible_books_id", using: :btree

  create_table "bible_search_caches", force: true do |t|
    t.string   "bible_version"
    t.string   "bible_book_abbreviation"
    t.integer  "chapter"
    t.integer  "verse"
    t.text     "content"
    t.string   "copyright"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bible_verses", force: true do |t|
    t.integer  "bible_chapters_id"
    t.integer  "bible_verse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bible_verses", ["bible_chapters_id"], name: "index_bible_verses_on_bible_chapters_id", using: :btree

  create_table "bible_versions", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "book_start"
    t.integer  "chapter_start"
    t.integer  "verse_start"
    t.integer  "chapter_end"
    t.integer  "verse_end"
    t.string   "bible_version"
  end

  create_table "messages", force: true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     default: false
    t.boolean  "recipient_delete",           default: false
    t.boolean  "sender_delete",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.boolean  "recipient_permanent_delete", default: false
    t.boolean  "sender_permanent_delete",    default: false
  end

  add_index "messages", ["ancestry"], name: "index_messages_on_ancestry", using: :btree
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], name: "acts_as_messageable_ids", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_bible_views", force: true do |t|
    t.integer  "users_id"
    t.string   "bible_version"
    t.string   "book"
    t.integer  "chapter"
    t.integer  "verse_from"
    t.integer  "verse_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_dropdown_id"
  end

  add_index "user_bible_views", ["users_id"], name: "index_user_bible_views_on_users_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "user_name"
    t.string   "full_name"
    t.string   "denomination"
    t.string   "church"
    t.integer  "bible_version_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
