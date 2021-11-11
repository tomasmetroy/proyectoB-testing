# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_11_161820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies_showtimes", id: false, force: :cascade do |t|
    t.bigint "showtime_id", null: false
    t.bigint "movie_id", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules_showtimes", id: false, force: :cascade do |t|
    t.bigint "showtime_id", null: false
    t.bigint "schedule_id", null: false
  end

  create_table "showtimes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_id", null: false
    t.bigint "schedule_id", null: false
    t.bigint "theater_id", null: false
    t.index ["movie_id"], name: "index_showtimes_on_movie_id"
    t.index ["schedule_id"], name: "index_showtimes_on_schedule_id"
    t.index ["theater_id"], name: "index_showtimes_on_theater_id"
  end

  create_table "showtimes_theaters", id: false, force: :cascade do |t|
    t.bigint "showtime_id", null: false
    t.bigint "theater_id", null: false
  end

  create_table "showtimes_tickets", id: false, force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "showtime_id", null: false
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "username"
    t.string "column"
    t.string "row"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "showtime_id", null: false
    t.index ["showtime_id"], name: "index_tickets_on_showtime_id"
  end

  add_foreign_key "showtimes", "movies"
  add_foreign_key "showtimes", "schedules"
  add_foreign_key "showtimes", "theaters"
  add_foreign_key "tickets", "showtimes"
end
