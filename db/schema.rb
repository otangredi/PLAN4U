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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_194328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "e_vites", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template_id"
    t.index ["event_id"], name: "index_e_vites_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "venue"
    t.string "partner_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "guest_choices", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "choices", default: [], array: true
    t.index ["guest_id"], name: "index_guest_choices_on_guest_id"
  end

  create_table "guest_seats", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.bigint "guest_table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_guest_seats_on_guest_id"
    t.index ["guest_table_id"], name: "index_guest_seats_on_guest_table_id"
  end

  create_table "guest_tables", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_of_seats"
    t.index ["event_id"], name: "index_guest_tables_on_event_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "relationship"
    t.string "email"
    t.integer "status", default: 0
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["event_id"], name: "index_guests_on_event_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.boolean "guest_list", default: false
    t.boolean "design_cards", default: false
    t.boolean "send_cards", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "e_vites", "events"
  add_foreign_key "events", "users"
  add_foreign_key "guest_choices", "guests"
  add_foreign_key "guest_seats", "guest_tables"
  add_foreign_key "guest_seats", "guests"
  add_foreign_key "guest_tables", "events"
  add_foreign_key "guests", "events"
end
