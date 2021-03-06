# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_918_121_248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'conditions', force: :cascade do |t|
    t.string 'divepoint', default: '', null: false
    t.integer 'status', default: 0, null: false
    t.integer 'temperature'
    t.integer 'visibility'
    t.text 'content'
    t.text 'image'
    t.bigint 'user_id'
    t.bigint 'divesite_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['divesite_id'], name: 'index_conditions_on_divesite_id'
    t.index ['status'], name: 'index_conditions_on_status'
    t.index ['user_id'], name: 'index_conditions_on_user_id'
  end

  create_table 'divesites', force: :cascade do |t|
    t.integer 'area', default: 0, null: false
    t.integer 'zone', default: 0, null: false
    t.string 'name', default: '', null: false
    t.string 'address', default: '', null: false
    t.string 'phone', default: '', null: false
    t.string 'service', default: '', null: false
    t.text 'discription', default: '', null: false
    t.float 'latitude', default: 35.6813363998796, null: false
    t.float 'longitude', default: 139.76714625537713, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'divesite_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[follower_id followed_id], name: 'index_relationships_on_follower_id_and_followed_id', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.text 'avatar', default: ''
    t.string 'shop', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin', default: false
    t.string 'provider', default: '', null: false
    t.string 'uid', default: '', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'conditions', 'divesites'
  add_foreign_key 'conditions', 'users'
end
