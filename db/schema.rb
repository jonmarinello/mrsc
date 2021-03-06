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

ActiveRecord::Schema.define(version: 20160603013023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "potential_projects", force: :cascade do |t|
    t.string   "name",                                              null: false
    t.string   "email",                                             null: false
    t.string   "phone"
    t.string   "company_name"
    t.text     "project_idea",                                      null: false
    t.boolean  "type_ruby_on_rails_web_development"
    t.boolean  "type_cms_web_development"
    t.boolean  "type_mobile_app_development"
    t.boolean  "type_everything_cloud"
    t.boolean  "type_other"
    t.string   "start_timeframe"
    t.text     "additional_info"
    t.string   "heard_about_us"
    t.boolean  "keep_me_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",                          default: true, null: false
    t.boolean  "type_ux_prototyping"
    t.boolean  "type_agile_development"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "title",                     null: false
    t.text     "body",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url",  default: "",   null: false
    t.integer  "position"
    t.boolean  "is_active",  default: true, null: false
  end

end
