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

ActiveRecord::Schema.define(version: 20131211181239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contactos", force: true do |t|
    t.integer  "empregado_id"
    t.integer  "amigo_id"
    t.boolean  "pendente"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departamentos", force: true do |t|
    t.string   "name"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empregados", force: true do |t|
    t.string   "name"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "images"
    t.integer  "image"
    t.string   "location"
    t.string   "job"
    t.text     "about"
  end

  add_index "empregados", ["email"], name: "index_empregados_on_email", unique: true, using: :btree
  add_index "empregados", ["reset_password_token"], name: "index_empregados_on_reset_password_token", unique: true, using: :btree

  create_table "empresas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "free_places"
    t.integer  "spots"
    t.binary   "logo"
    t.text     "description"
  end

  create_table "posts", force: true do |t|
    t.integer  "empregado_id"
    t.text     "text"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
