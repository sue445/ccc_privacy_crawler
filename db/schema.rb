# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2014_11_19_131622) do

  create_table "companies", force: :cascade do |t|
    t.integer "no", null: false
    t.string "company_name", null: false
    t.string "receipted_date", null: false
    t.text "destination_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["company_name", "receipted_date"], name: "index_companies_on_company_name_and_receipted_date", unique: true
  end

end
