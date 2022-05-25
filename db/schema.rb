# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_25_190230) do
  create_table "comments", force: :cascade do |t|
    t.integer "ID_User"
    t.integer "ID_ForumPost"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_posts", force: :cascade do |t|
    t.integer "ID_User"
    t.integer "ID_Role"
    t.string "content"
    t.string "description"
    t.boolean "isHandBook"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_offers", force: :cascade do |t|
    t.integer "ID_User"
    t.integer "ID_ForumPost"
    t.string "content"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.boolean "isEmployee"
    t.boolean "isRepairBuisness"
    t.boolean "isUser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "users", force: :cascade do |t|
    t.string "nickName"
    t.string "name"
    t.string "eMail"
    t.integer "phoneNumber"
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_forum_posts", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "forum_post_id"
    t.index ["forum_post_id"], name: "index_users_forum_posts_on_forum_post_id"
    t.index ["user_id"], name: "index_users_forum_posts_on_user_id"
  end

end
