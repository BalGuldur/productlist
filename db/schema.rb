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

ActiveRecord::Schema.define(version: 20150428211444) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "fio"
    t.integer  "department_id"
    t.string   "phone"
    t.string   "mobphone"
    t.string   "email"
    t.string   "job"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "managers", force: true do |t|
    t.string   "name"
    t.string   "sourname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderparts", force: true do |t|
    t.string   "partnumber"
    t.text     "partdescr"
    t.integer  "qty"
    t.float    "pricesell",      limit: 24
    t.float    "priceship",      limit: 24
    t.string   "shipper"
    t.integer  "beznal"
    t.float    "convert",        limit: 24
    t.string   "predatetime"
    t.string   "faktdatetime"
    t.integer  "statereserv_id"
    t.integer  "nds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "manager_id"
    t.integer  "numbill"
    t.integer  "purchaser_id"
    t.integer  "shipprice"
    t.integer  "addrate"
    t.string   "datetimedone"
    t.integer  "margin"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doner_id"
    t.integer  "statereserv_id"
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

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.string   "fio"
    t.string   "phone"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statereservs", force: true do |t|
    t.string   "status"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
