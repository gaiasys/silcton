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

ActiveRecord::Schema.define(version: 20200427123809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experimenters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "web_site"
    t.string "country"
    t.integer "lab_id"
    t.boolean "lab_manager", default: false
    t.boolean "administrator"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_experimenters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_experimenters_on_reset_password_token", unique: true
  end

  create_table "instrument_in_studies", force: :cascade do |t|
    t.integer "study_id"
    t.integer "order"
    t.string "instrument"
    t.string "version"
    t.boolean "force_wait"
    t.boolean "randomize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "web_site"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_entries", force: :cascade do |t|
    t.string "type"
    t.integer "user_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mrt_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "q11"
    t.string "q12"
    t.string "q13"
    t.string "q14"
    t.string "q15"
    t.string "q16"
    t.string "q17"
    t.string "q18"
    t.string "q19"
    t.string "q20"
    t.boolean "force_wait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.boolean "share_data", default: false
    t.string "vambler_main_routes_order"
    t.string "vambler_connector_routes_order"
    t.string "identification"
    t.integer "study_id"
    t.string "age"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pf_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "q11"
    t.string "q12"
    t.string "q13"
    t.string "q14"
    t.string "q15"
    t.string "q16"
    t.string "q17"
    t.string "q18"
    t.string "q19"
    t.string "q20"
    t.boolean "force_wait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "psas_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "q11"
    t.string "q12"
    t.string "q13"
    t.string "q14"
    t.string "q15"
    t.string "q16"
    t.string "q17"
    t.string "q18"
    t.string "q19"
    t.string "q20"
    t.string "q21"
    t.string "q22"
    t.string "q23"
    t.string "q24"
    t.string "q25"
    t.string "length"
    t.boolean "randomized"
  end

  create_table "pvas_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.boolean "randomized"
  end

  create_table "sbsod_records", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "q1"
    t.integer "q2"
    t.integer "q3"
    t.integer "q4"
    t.integer "q5"
    t.integer "q6"
    t.integer "q7"
    t.integer "q8"
    t.integer "q9"
    t.integer "q10"
    t.integer "q11"
    t.integer "q12"
    t.integer "q13"
    t.integer "q14"
    t.integer "q15"
    t.boolean "randomized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.string "kind_of_start_buttons"
    t.string "when_to_share_data", default: "3years"
    t.integer "lab_id"
    t.integer "experimenter_id"
    t.boolean "active"
    t.boolean "ask_participant_id"
    t.boolean "ask_name"
    t.boolean "ask_email"
    t.boolean "ask_age"
    t.boolean "ask_sex"
    t.text "welcome_text"
    t.text "completion_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vambler_demographics_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "gender"
    t.string "ethnic_category"
    t.string "racial_category"
    t.string "education"
    t.string "handedness"
    t.string "first_language"
    t.text "prescription_meds"
    t.text "head_injuries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_direction_estimates", force: :cascade do |t|
    t.integer "virtual_direction_test_id"
    t.integer "start_landmark_id"
    t.integer "facing_landmark_id"
    t.integer "target_landmark_id"
    t.integer "bearing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "error", default: false
  end

  create_table "virtual_direction_tests", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "virtual_environment_id"
    t.string "style"
    t.integer "seconds_taken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_distance_estimates", force: :cascade do |t|
    t.integer "virtual_distance_test_id"
    t.integer "start_landmark_id"
    t.integer "target_landmark_id"
    t.integer "anchor_landmark_id"
    t.integer "target_pixel_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_distance_tests", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "virtual_environment_id"
    t.integer "seconds_taken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_environments", force: :cascade do |t|
    t.string "name"
    t.integer "map_arrangement_pixel_width"
    t.integer "map_arrangement_pixel_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_landmarks", force: :cascade do |t|
    t.string "name"
    t.string "map_arrangement_piece_image"
    t.string "icon_image"
    t.integer "piece_upper_left_pixel_x"
    t.integer "piece_upper_left_pixel_y"
    t.integer "front_door_pixel_x"
    t.integer "front_door_pixel_y"
    t.integer "pointing_location_pixel_x"
    t.integer "pointing_location_pixel_y"
    t.integer "virtual_route_id"
    t.integer "virtual_environment_id"
    t.integer "visit_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_map_arrangement_pieces", force: :cascade do |t|
    t.integer "virtual_map_arrangement_id"
    t.integer "virtual_landmark_id"
    t.integer "upper_left_pixel_x"
    t.integer "upper_left_pixel_y"
    t.integer "placement_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_map_arrangements", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "virtual_environment_id"
    t.integer "seconds_taken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_navigation_logs", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "virtual_environment_id"
    t.string "route"
    t.text "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_virtual_navigation_logs_on_participant_id"
    t.index ["virtual_environment_id"], name: "index_virtual_navigation_logs_on_virtual_environment_id"
  end

  create_table "virtual_routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vv_records", force: :cascade do |t|
    t.integer "participant_id"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "q11"
    t.string "q12"
    t.string "q13"
    t.string "q14"
    t.string "q15"
    t.string "q16"
    t.string "q17"
    t.string "q18"
    t.string "q19"
    t.string "q20"
    t.string "q21"
    t.string "q22"
    t.string "q23"
    t.string "q24"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
