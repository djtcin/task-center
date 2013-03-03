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

ActiveRecord::Schema.define(:version => 20130221042410) do

  create_table "archives", :force => true do |t|
    t.string   "name"
    t.string   "format"
    t.integer  "size"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spaces", :primary_key => "redu_id", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "submissions", :force => true do |t|
    t.string   "comment"
    t.decimal  "grade"
    t.datetime "lastupdate"
    t.datetime "remember"
    t.boolean  "submitted"
    t.boolean  "viewed"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "submissions", ["task_id"], :name => "index_submissions_on_task_id"
  add_index "submissions", ["user_id"], :name => "index_submissions_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.boolean  "status"
    t.boolean  "public"
    t.boolean  "autolock"
    t.integer  "hasComment"
    t.integer  "hasArchives"
    t.integer  "space_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tasks", ["space_id"], :name => "index_tasks_on_space_id"

  create_table "users", :primary_key => "redu_id", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "pic"
    t.string   "token"
    t.boolean  "student"
    t.datetime "rememberDefault"
    t.boolean  "emailNewTask"
    t.boolean  "emailChangeTask"
    t.boolean  "emailNewGrade"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
