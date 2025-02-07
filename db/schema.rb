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

ActiveRecord::Schema.define(version: 2021_10_26_093038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "agrupations", force: :cascade do |t|
    t.bigint "layer_id"
    t.bigint "layer_group_id"
    t.index ["layer_group_id"], name: "index_agrupations_on_layer_group_id"
    t.index ["layer_id"], name: "index_agrupations_on_layer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "identities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "indicators", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "version"
    t.datetime "created_at", default: "2021-10-26 09:35:08", null: false
    t.datetime "updated_at", default: "2021-10-26 09:35:08", null: false
    t.integer "category_id"
    t.integer "position"
    t.string "column_name"
    t.string "operation"
    t.index ["slug"], name: "index_indicators_on_slug"
  end

  create_table "indicators_models", id: false, force: :cascade do |t|
    t.bigint "indicator_id", null: false
    t.bigint "model_id", null: false
  end

  create_table "layer_group_translations", force: :cascade do |t|
    t.bigint "layer_group_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "info"
    t.index ["layer_group_id"], name: "index_layer_group_translations_on_layer_group_id"
    t.index ["locale"], name: "index_layer_group_translations_on_locale"
  end

  create_table "layer_groups", force: :cascade do |t|
    t.integer "super_group_id"
    t.string "slug"
    t.string "layer_group_type"
    t.string "category"
    t.boolean "active"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon_class"
    t.integer "site_scope_id", default: 1
    t.index ["site_scope_id"], name: "index_layer_groups_on_site_scope_id"
    t.index ["super_group_id"], name: "index_layer_groups_on_super_group_id"
  end

  create_table "layer_translations", force: :cascade do |t|
    t.bigint "layer_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "info"
    t.text "legend"
    t.string "title"
    t.string "data_units"
    t.string "processing"
    t.text "description"
    t.index ["layer_id"], name: "index_layer_translations_on_layer_id"
    t.index ["locale"], name: "index_layer_translations_on_locale"
  end

  create_table "layers", force: :cascade do |t|
    t.integer "layer_group_id"
    t.string "slug", null: false
    t.string "layer_type"
    t.integer "zindex"
    t.boolean "active"
    t.integer "order"
    t.string "color"
    t.string "layer_provider"
    t.text "css"
    t.text "interactivity"
    t.float "opacity"
    t.text "query"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "locate_layer", default: false
    t.string "icon_class"
    t.boolean "published", default: true
    t.integer "zoom_max", default: 100
    t.integer "zoom_min", default: 0
    t.integer "dashboard_order"
    t.boolean "download", default: false
    t.string "dataset_shortname"
    t.text "dataset_source_url"
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "spatial_resolution"
    t.string "spatial_resolution_units"
    t.string "temporal_resolution"
    t.string "temporal_resolution_units"
    t.string "update_frequency"
    t.string "version"
    t.boolean "analysis_suitable", default: false
    t.text "analysis_query"
    t.text "layer_config"
    t.text "analysis_body"
    t.text "interaction_config"
    t.index ["layer_group_id"], name: "index_layers_on_layer_group_id"
  end

  create_table "layers_sources", id: false, force: :cascade do |t|
    t.integer "layer_id"
    t.integer "source_id"
    t.index ["layer_id"], name: "index_layers_sources_on_layer_id"
    t.index ["source_id"], name: "index_layers_sources_on_source_id"
  end

  create_table "map_menu_entries", force: :cascade do |t|
    t.string "label"
    t.string "link"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_map_menu_entries_on_ancestry"
  end

  create_table "models", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "source"
    t.datetime "created_at", default: "2021-10-26 09:35:08", null: false
    t.datetime "updated_at", default: "2021-10-26 09:35:08", null: false
    t.text "query_analysis"
    t.string "table_name"
  end

  create_table "models_site_scopes", id: false, force: :cascade do |t|
    t.bigint "model_id", null: false
    t.bigint "site_scope_id", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "image_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "share_urls", force: :cascade do |t|
    t.string "uid"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "site_pages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "priority"
    t.integer "site_scope_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["site_scope_id"], name: "index_site_pages_on_site_scope_id"
    t.index ["slug"], name: "index_site_pages_on_slug", unique: true
    t.index ["title", "site_scope_id"], name: "index_site_pages_on_title_and_site_scope_id", unique: true
  end

  create_table "site_scopes", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "subdomain"
    t.boolean "has_analysis", default: false
    t.float "latitude"
    t.float "longitude"
    t.string "header_theme"
    t.integer "zoom_level", default: 3
    t.text "linkback_text"
    t.text "linkback_url"
    t.string "header_color"
    t.text "logo_url"
    t.boolean "predictive_model", default: false, null: false
    t.boolean "analysis_options", default: false, null: false
    t.string "analytics_code"
    t.boolean "has_gef_logo"
  end

  create_table "sources", force: :cascade do |t|
    t.string "source_type"
    t.string "reference"
    t.string "reference_short"
    t.string "url"
    t.string "contact_name"
    t.string "contact_email"
    t.string "license"
    t.datetime "last_updated"
    t.string "version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "spatial_resolution_units"
    t.text "license_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "organization"
    t.string "organization_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agrupations", "layer_groups"
  add_foreign_key "agrupations", "layers"
  add_foreign_key "identities", "users"
  add_foreign_key "indicators", "categories"
end
