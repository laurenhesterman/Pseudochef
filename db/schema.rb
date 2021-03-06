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

ActiveRecord::Schema.define(version: 20171222014900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizeds", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizeds", ["category_id"], name: "index_categorizeds_on_category_id", using: :btree
  add_index "categorizeds", ["recipe_id"], name: "index_categorizeds_on_recipe_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["recipe_id"], name: "index_comments_on_recipe_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "downvotes", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "downvotes", ["recipe_id"], name: "index_downvotes_on_recipe_id", using: :btree
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "ingredients"
    t.integer  "level"
    t.integer  "time"
    t.string   "modifications"
    t.text     "text"
    t.string   "links"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvotes", ["recipe_id"], name: "index_upvotes_on_recipe_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "categorizeds", "categories"
  add_foreign_key "categorizeds", "recipes"
  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "downvotes", "recipes"
  add_foreign_key "downvotes", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "upvotes", "recipes"
  add_foreign_key "upvotes", "users"
end
