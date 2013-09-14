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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130914163324) do

  create_table "allergies", :force => true do |t|
    t.string   "cause"
    t.string   "observations"
    t.date     "record_date"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
  end

  create_table "antecedents", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
  end

  create_table "attention_periods", :force => true do |t|
    t.integer  "begin_hour"
    t.integer  "begin_minutes"
    t.integer  "end_hour"
    t.integer  "end_minutes"
    t.integer  "week_day"
    t.integer  "medical_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "attention_times", :force => true do |t|
    t.datetime "time"
    t.string   "state"
    t.integer  "patient_id"
    t.integer  "medical_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "consultations", :force => true do |t|
    t.date     "achievement_date"
    t.string   "symptomps"
    t.string   "diagnostic"
    t.string   "treatment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_id"
    t.integer  "medical_history_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "home_phone"
    t.string   "movile_phone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "patient_id"
  end

  create_table "diseases", :force => true do |t|
    t.date     "record_date"
    t.string   "name"
    t.string   "observations"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
  end

  create_table "medical_exams", :force => true do |t|
    t.date     "achievement_date"
    t.string   "name"
    t.string   "results"
    t.string   "observations"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
  end

  create_table "medical_histories", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medical_specializations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medicals", :force => true do |t|
    t.string  "cuil",                          :default => "", :null => false
    t.string  "dni",                           :default => "", :null => false
    t.string  "firstname",                     :default => "", :null => false
    t.string  "lastname",                      :default => "", :null => false
    t.string  "email"
    t.string  "home_phone",                    :default => "", :null => false
    t.string  "movile_phone",                  :default => "", :null => false
    t.integer "medical_specialization_id"
    t.integer "attention_time_length_hour"
    t.integer "attention_time_length_minutes"
  end

  add_index "medicals", ["cuil"], :name => "index_medicals_on_cuil", :unique => true
  add_index "medicals", ["dni"], :name => "index_medicals_on_dni", :unique => true

  create_table "medications", :force => true do |t|
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "name"
    t.string   "dose"
    t.string   "how_often"
    t.string   "route"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
    t.decimal  "amount"
  end

  create_table "patients", :force => true do |t|
    t.string   "dni"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.decimal  "height",              :precision => 8, :scale => 2
    t.decimal  "weight",              :precision => 8, :scale => 2
    t.string   "blood_type"
    t.string   "sex"
    t.string   "address"
    t.string   "home_phone"
    t.string   "movile_phone"
    t.string   "email"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "medical_history_id"
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "dni",                    :default => "", :null => false
    t.string   "authentication_token"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["dni"], :name => "index_users_on_dni", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vaccines", :force => true do |t|
    t.string   "name"
    t.date     "last_application"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "medical_history_id"
  end

end
