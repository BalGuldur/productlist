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

ActiveRecord::Schema.define(version: 20150505173632) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.boolean  "saleright"
    t.boolean  "purchaserright"
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
  end

  create_table "orderstates", force: true do |t|
    t.string   "state"
    t.string   "color"
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

end
