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

ActiveRecord::Schema.define(version: 20141119131622) do

  create_table "companies", force: :cascade do |t|
    t.integer  "no",               null: false
    t.string   "company_name",     null: false
    t.string   "receipted_date",   null: false
    t.text     "destination_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["company_name", "receipted_date"], name: "index_companies_on_company_name_and_receipted_date", unique: true
  end

end
