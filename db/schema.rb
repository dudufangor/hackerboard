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

ActiveRecord::Schema.define(:version => 20120429160152) do

  create_table "categories", :force => true do |t|
    t.string   "name",                           :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "questions_count", :default => 0
    t.datetime "deleted_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title",                           :null => false
    t.text     "body",                            :null => false
    t.integer  "user_id",                         :null => false
    t.integer  "category_id",                     :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "replies_count", :default => 0
    t.boolean  "delta",         :default => true, :null => false
    t.integer  "views_count",   :default => 0
  end

  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "replies", :force => true do |t|
    t.text     "body",        :null => false
    t.integer  "user_id",     :null => false
    t.integer  "question_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "replies", ["question_id"], :name => "index_replies_on_question_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "email",                               :null => false
    t.string   "password_hash",                       :null => false
    t.string   "password_salt",                       :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "questions_count", :default => 0
    t.integer  "replies_count",   :default => 0
    t.string   "role",            :default => "user", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
