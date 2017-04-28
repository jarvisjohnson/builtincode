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

ActiveRecord::Schema.define(version: 20170428205128) do

  create_table "clients", primary_key: "uuid", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "oauth_avatar"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "contact_name"
    t.string   "business_name"
    t.string   "billing_currency",       default: "AUD"
    t.string   "stripe_account_id"
    t.boolean  "admin"
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_clients_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_clients_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_clients_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_clients_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree
  end

  create_table "clients_websites", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "client_id",  null: false
    t.integer "website_id", null: false
    t.index ["client_id"], name: "index_clients_websites_on_client_id", using: :btree
    t.index ["website_id"], name: "index_clients_websites_on_website_id", using: :btree
  end

  create_table "features", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "website_id"
    t.integer  "billing_units", default: 2
    t.integer  "quantity",      default: 1
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["website_id"], name: "index_features_on_website_id", using: :btree
  end

  create_table "features_websites", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "website_id", null: false
    t.integer "feature_id", null: false
    t.index ["feature_id"], name: "index_features_websites_on_feature_id", using: :btree
    t.index ["website_id"], name: "index_features_websites_on_website_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",                        limit: 65535
    t.integer  "support_conversation_id"
    t.integer  "client_id"
    t.integer  "stores_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "attached_image_file_name"
    t.string   "attached_image_content_type"
    t.integer  "attached_image_file_size"
    t.datetime "attached_image_updated_at"
    t.index ["client_id"], name: "index_messages_on_client_id", using: :btree
    t.index ["stores_id"], name: "index_messages_on_stores_id", using: :btree
    t.index ["support_conversation_id"], name: "index_messages_on_support_conversation_id", using: :btree
  end

  create_table "support_conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id", "receiver_id"], name: "index_support_conversations_on_author_id_and_receiver_id", unique: true, using: :btree
    t.index ["author_id"], name: "index_support_conversations_on_author_id", using: :btree
    t.index ["receiver_id"], name: "index_support_conversations_on_receiver_id", using: :btree
  end

  create_table "support_requests", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "websites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "client_id"
    t.integer  "features_id"
    t.integer  "billing_units",          default: 30
    t.string   "name"
    t.string   "app_type"
    t.boolean  "ssl",                    default: false
    t.boolean  "cdn",                    default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "billing_currency",       default: "AUD"
    t.boolean  "paid"
    t.string   "stripe_subscription_id"
    t.string   "hosting_units"
    t.integer  "monthly_cost_cents",     default: 2500
    t.string   "production_url"
    t.string   "staging_url"
    t.string   "live_status",            default: "live"
    t.index ["client_id"], name: "index_websites_on_client_id", using: :btree
    t.index ["features_id"], name: "index_websites_on_features_id", using: :btree
  end

  add_foreign_key "features", "websites"
  add_foreign_key "messages", "support_conversations"
  add_foreign_key "websites", "clients", primary_key: "uuid"
end
