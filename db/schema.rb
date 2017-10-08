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

ActiveRecord::Schema.define(version: 20170918191452) do

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "owner_id"
    t.integer  "client_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["client_id"], name: "index_campaigns_on_client_id", using: :btree
    t.index ["owner_id"], name: "index_campaigns_on_owner_id", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_clients_on_owner_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "reporting_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["reporting_id"], name: "index_images_on_reporting_id", using: :btree
  end

  create_table "ooh_sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "authority"
    t.string   "name"
    t.string   "type"
    t.text     "address",            limit: 65535
    t.string   "locality"
    t.string   "location"
    t.string   "city"
    t.integer  "images_count"
    t.string   "code"
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.integer  "owner_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["owner_id"], name: "index_ooh_sites_on_owner_id", using: :btree
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reportings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.date     "date"
    t.integer  "ooh_site_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id"], name: "index_reportings_on_campaign_id", using: :btree
    t.index ["ooh_site_id"], name: "index_reportings_on_ooh_site_id", using: :btree
  end

  add_foreign_key "campaigns", "clients"
  add_foreign_key "campaigns", "owners"
  add_foreign_key "clients", "owners"
  add_foreign_key "images", "reportings"
  add_foreign_key "ooh_sites", "owners"
  add_foreign_key "reportings", "campaigns"
  add_foreign_key "reportings", "ooh_sites"
end
