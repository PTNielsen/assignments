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

ActiveRecord::Schema.define(version: 20170608185546) do

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.string   "status"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["slug"], name: "index_blog_posts_on_slug", unique: true
    t.index ["status"], name: "index_blog_posts_on_status"
    t.index ["title"], name: "index_blog_posts_on_title", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "blog_post_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
