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

ActiveRecord::Schema.define(version: 20150510233137) do

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.string   "address1",       null: false
    t.string   "address2"
    t.string   "city",           null: false
    t.string   "postal_code",    null: false
    t.string   "avatar"
    t.integer  "typ_country_id"
    t.integer  "typ_region_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string   "email_address"
    t.string   "type"
    t.integer  "contact_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "telephone_numbers", force: :cascade do |t|
    t.string   "telephone_number"
    t.string   "type"
    t.integer  "contact_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "typ_countries", force: :cascade do |t|
    t.string   "iso"
    t.string   "iso3"
    t.string   "fips"
    t.string   "country"
    t.string   "continent"
    t.string   "currency_code"
    t.string   "currency_name"
    t.string   "phone_prefix"
    t.string   "postal_code"
    t.string   "languages"
    t.string   "geonameid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "typ_regions", force: :cascade do |t|
    t.string   "name"
    t.string   "timezone"
    t.integer  "typ_country_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
