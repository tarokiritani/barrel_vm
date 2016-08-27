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

ActiveRecord::Schema.define(version: 20160708114139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.string   "analysis_type"
    t.string   "comment"
    t.integer  "cell_id"
  end

  add_index "analyses", ["cell_id"], name: "index_analyses_on_cell_id", using: :btree

  create_table "cells", force: :cascade do |t|
    t.string   "cell_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "channel"
    t.string   "brain_area"
    t.string   "layer"
    t.string   "intracellular"
    t.decimal  "pipette_offset"
    t.decimal  "pipette_resistance"
    t.integer  "depth"
    t.decimal  "temparature"
    t.string   "experiment_number"
    t.text     "comment"
    t.integer  "mouse_id"
  end

  add_index "cells", ["mouse_id"], name: "index_cells_on_mouse_id", using: :btree

  create_table "mice", force: :cascade do |t|
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "species_strain"
    t.datetime "date_of_birth"
    t.integer  "number"
    t.text     "comment"
    t.string   "cage_number"
  end

  add_foreign_key "analyses", "cells"
  add_foreign_key "cells", "mice"
end
