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

ActiveRecord::Schema.define(version: 20160528154918) do

  create_table "cidades", force: :cascade do |t|
    t.integer  "codigo",     limit: 4
    t.string   "nome",       limit: 255
    t.integer  "estado_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.integer  "codigo",     limit: 4
    t.string   "nome",       limit: 255
    t.string   "sigla",      limit: 255
    t.string   "regiao",     limit: 255
    t.integer  "pais_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "paises", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "participantes", force: :cascade do |t|
    t.string   "nome",                          limit: 255
    t.string   "documento",                     limit: 255
    t.integer  "tipo_participante_id",          limit: 4
    t.integer  "cidade_id",                     limit: 4
    t.integer  "pais_id",                       limit: 4
    t.string   "instituicao",                   limit: 255
    t.boolean  "possui_necessidades_especiais"
    t.text     "necessidades_especiais",        limit: 65535
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "email",                         limit: 255,   default: "", null: false
    t.string   "password_digest",            limit: 255,   default: "", null: false
    t.string   "reset_password_token",          limit: 255
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token",            limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",             limit: 255
  end

  add_index "participantes", ["cidade_id"], name: "index_participantes_on_cidade_id", using: :btree
  add_index "participantes", ["confirmation_token"], name: "index_participantes_on_confirmation_token", unique: true, using: :btree
  add_index "participantes", ["email"], name: "index_participantes_on_email", unique: true, using: :btree
  add_index "participantes", ["pais_id"], name: "index_participantes_on_pais_id", using: :btree
  add_index "participantes", ["reset_password_token"], name: "index_participantes_on_reset_password_token", unique: true, using: :btree
  add_index "participantes", ["tipo_participante_id"], name: "index_participantes_on_tipo_participante_id", using: :btree

  create_table "tipo_participantes", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "cidades", "estados"
  add_foreign_key "participantes", "cidades"
  add_foreign_key "participantes", "paises"
  add_foreign_key "participantes", "tipo_participantes"
end
