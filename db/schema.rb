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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_073643) do
  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "album_type"
    t.date "release_date"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.string "country"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_songs", id: false, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "song_id", null: false
    t.index ["artist_id", "song_id"], name: "index_artists_songs_on_artist_id_and_song_id"
    t.index ["song_id", "artist_id"], name: "index_artists_songs_on_song_id_and_artist_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bookmarkable_type"
    t.integer "bookmarkable_id"
    t.index ["bookmarkable_type", "bookmarkable_id"], name: "index_bookmarks_on_bookmarkable"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "discographies", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_discographies_on_album_id"
    t.index ["artist_id"], name: "index_discographies_on_artist_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang_code"
    t.string "lang_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "language_id", null: false
    t.text "lyric_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_lyrics_on_language_id"
    t.index ["song_id"], name: "index_lyrics_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.string "composer"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "language_id", null: false
    t.index ["language_id"], name: "index_songs_on_language_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["song_id"], name: "index_tracks_on_song_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "discographies", "albums"
  add_foreign_key "discographies", "artists"
  add_foreign_key "lyrics", "languages"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "songs", "languages"
  add_foreign_key "tracks", "albums"
  add_foreign_key "tracks", "songs"
end
