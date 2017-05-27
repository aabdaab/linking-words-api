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

ActiveRecord::Schema.define(version: 20170429224411) do

  create_table "adnotations", force: :cascade do |t|
    t.text     "phrase"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_adnotations_on_word_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_categories_on_language_id"
  end

  create_table "categories_words", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "word_id",     null: false
    t.index ["category_id", "word_id"], name: "index_categories_words_on_category_id_and_word_id"
    t.index ["word_id", "category_id"], name: "index_categories_words_on_word_id_and_category_id"
  end

  create_table "category_words", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_words_on_category_id"
    t.index ["word_id"], name: "index_category_words_on_word_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_sections_on_language_id"
  end

  create_table "translations", force: :cascade do |t|
    t.string   "name"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_translations_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "key"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_words_on_section_id"
  end

end
