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

ActiveRecord::Schema.define(version: 20150728200613) do

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "hex"
    t.string   "if"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.boolean  "saleright"
    t.boolean  "purchaserright"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "viewallord"
  end

  create_table "distributors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "fio"
    t.integer  "department_id"
    t.string   "intphone"
    t.string   "mobphone"
    t.string   "job"
    t.string   "email"
    t.boolean  "enable"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "admin"
    t.boolean  "reestrright"
  end

  create_table "intproducts", force: true do |t|
    t.string   "name"
    t.string   "partnumber"
    t.string   "serialnumber"
    t.integer  "prodtype_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moneytypes", force: true do |t|
    t.string   "name"
    t.string   "znak"
    t.float    "curse",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderparts", force: true do |t|
    t.string   "partnum"
    t.text     "descr"
    t.integer  "qty"
    t.integer  "psaleprice"
    t.integer  "doner_id"
    t.integer  "state_id"
    t.integer  "panswtime_id"
    t.float    "rezprice",        limit: 24
    t.integer  "rezpricetype_id"
    t.integer  "nds"
    t.integer  "beznal"
    t.integer  "pshiptime_id"
    t.integer  "shipprice"
    t.float    "convertion",      limit: 24
    t.integer  "pmargin"
    t.text     "comment"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "reztime"
    t.integer  "distributor_id"
    t.string   "idorddistrib"
  end

  add_index "orderparts", ["order_id"], name: "index_orderparts_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "numbill"
    t.integer  "manager_id"
    t.integer  "doner_id"
    t.integer  "orderstate_id"
    t.integer  "addrate"
    t.integer  "sum"
    t.integer  "pmargin"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "purchaser"
    t.boolean  "arhive"
  end

  create_table "orderstates", force: true do |t|
    t.string   "state"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ourtimes", force: true do |t|
    t.string   "name"
    t.boolean  "rez"
    t.boolean  "answ"
    t.boolean  "ship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prodtypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "productarticul"
    t.string   "distribarticul"
    t.text     "productname"
    t.string   "distributor"
    t.float    "pricedoll",      limit: 24
    t.float    "pricerub",       limit: 24
    t.string   "nalichie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reestrotgruzoks", force: true do |t|
    t.string   "kontragent"
    t.string   "numbill"
    t.string   "numotgruzdoc"
    t.date     "sendtoclient"
    t.date     "resievedate"
    t.date     "sendtobuh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numsfaktur"
    t.string   "reestrfile"
  end

  create_table "reestrprihodovs", force: true do |t|
    t.string   "kontragent"
    t.string   "numbill"
    t.string   "numprihoddoc"
    t.date     "prihoddate"
    t.date     "sendwithpech"
    t.date     "givetoruk"
    t.date     "givetobuh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numsfaktur"
    t.string   "reestrfile"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
