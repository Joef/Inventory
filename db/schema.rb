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

ActiveRecord::Schema.define(version: 20140301173306) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversions", force: true do |t|
    t.integer  "measure_a_id"
    t.integer  "measure_b_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "quantity",     precision: 8, scale: 2
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.decimal  "last_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_ingredients", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "ingredient_id"
    t.integer  "measure_id"
    t.decimal  "quantity"
    t.decimal  "price"
    t.decimal  "extended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.date     "invoice_date"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measures", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.string   "title"
    t.decimal  "price"
    t.decimal  "margin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_menu_items", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
