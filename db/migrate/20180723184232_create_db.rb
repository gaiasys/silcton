# frozen_string_literal: true

class CreateDb < ActiveRecord::Migration[5.1]
  def change
    create_table :experimenters do |t|
      t.string :first_name
      t.string :last_name
      t.string :web_site
      t.string :country
      t.integer :lab_id
      t.boolean :lab_manager, default: false
      t.boolean :administrator

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :experimenters, :email,                unique: true
    add_index :experimenters, :reset_password_token, unique: true

    create_table :labs do |t|
      t.string :name
      t.string :slug
      t.string :web_site
      t.string :country
      t.timestamps
    end
    create_table :studies do |t|
      t.string :name
      t.string :kind_of_start_buttons
      t.string :when_to_share_data, default: '3years'
      t.integer :lab_id
      t.integer :experimenter_id
      t.boolean :active
      t.boolean :ask_participant_id
      t.boolean :ask_name
      t.boolean :ask_email
      t.boolean :ask_age
      t.boolean :ask_sex
      t.text :welcome_text
      t.text :completion_text
      t.timestamps
    end
    create_table :instrument_in_studies do |t|
      t.integer :study_id
      t.integer :order
      t.string :instrument
      t.string :version
      t.boolean :force_wait
      t.boolean :randomize
      t.timestamps
    end
    create_table :participants do |t|
      t.boolean :share_data, default: false
      t.string :vambler_main_routes_order
      t.string :vambler_connector_routes_order
      t.string :identification
      t.integer :study_id
      t.string :age
      t.string :sex
      t.timestamps
    end
    create_table :participant_personal_records do |t|
      t.integer :participant_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
    create_table :sbsod_records do |t|
      t.integer :participant_id
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :q5
      t.integer :q6
      t.integer :q7
      t.integer :q8
      t.integer :q9
      t.integer :q10
      t.integer :q11
      t.integer :q12
      t.integer :q13
      t.integer :q14
      t.integer :q15
      t.boolean :randomized
      t.timestamps
    end
    create_table :mrt_records do |t|
      t.integer :participant_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :q11
      t.string :q12
      t.string :q13
      t.string :q14
      t.string :q15
      t.string :q16
      t.string :q17
      t.string :q18
      t.string :q19
      t.string :q20
      t.boolean :force_wait
      t.timestamps
    end
    create_table :pf_records do |t|
      t.integer :participant_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :q11
      t.string :q12
      t.string :q13
      t.string :q14
      t.string :q15
      t.string :q16
      t.string :q17
      t.string :q18
      t.string :q19
      t.string :q20
      t.boolean :force_wait
      t.timestamps
    end
    create_table :vv_records do |t|
      t.integer :participant_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :q11
      t.string :q12
      t.string :q13
      t.string :q14
      t.string :q15
      t.string :q16
      t.string :q17
      t.string :q18
      t.string :q19
      t.string :q20
      t.string :q21
      t.string :q22
      t.string :q23
      t.string :q24
      t.timestamps
    end
    create_table :pvas_records do |t|
      t.integer :participant_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.boolean :randomized
    end
    create_table :psas_records do |t|
      t.integer :participant_id
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :q11
      t.string :q12
      t.string :q13
      t.string :q14
      t.string :q15
      t.string :q16
      t.string :q17
      t.string :q18
      t.string :q19
      t.string :q20
      t.string :q21
      t.string :q22
      t.string :q23
      t.string :q24
      t.string :q25
      t.string :length
      t.boolean :randomized
    end
    create_table :log_entries do |t|
      t.string :type
      t.integer :user_id
      t.string :note
      t.timestamps
    end
        create_table :virtual_environments do |t|
      t.string :name
      t.integer :map_arrangement_pixel_width
      t.integer :map_arrangement_pixel_height
      t.timestamps
    end
    create_table :virtual_landmarks do |t|
      t.string :name
      t.string :map_arrangement_piece_image
      t.string :icon_image
      t.integer :piece_upper_left_pixel_x
      t.integer :piece_upper_left_pixel_y
      t.integer :front_door_pixel_x
      t.integer :front_door_pixel_y
      t.integer :pointing_location_pixel_x
      t.integer :pointing_location_pixel_y
      t.integer :virtual_route_id
      t.integer :virtual_environment_id
      t.integer :visit_order
      t.timestamps
    end
    create_table :virtual_routes do |t|
      t.string :name
      t.timestamps
    end
    create_table :virtual_map_arrangements do |t|
      t.integer :participant_id
      t.integer :virtual_environment_id
      t.integer :seconds_taken
      t.timestamps
    end
    create_table :virtual_map_arrangement_pieces do |t|
      t.integer :virtual_map_arrangement_id
      t.integer :virtual_landmark_id
      t.integer :upper_left_pixel_x
      t.integer :upper_left_pixel_y
      t.integer :placement_order
      t.timestamps
    end
    create_table :virtual_distance_tests do |t|
      t.integer :participant_id
      t.integer :virtual_environment_id
      t.integer :seconds_taken
      t.timestamps
    end
    create_table :virtual_distance_estimates do |t|
      t.integer :virtual_distance_test_id
      t.integer :start_landmark_id
      t.integer :target_landmark_id
      t.integer :anchor_landmark_id
      t.integer :target_pixel_position
      t.timestamps
    end
    create_table :virtual_direction_tests do |t|
      t.integer :participant_id
      t.integer :virtual_environment_id
      t.string :style
      t.integer :seconds_taken
      t.timestamps
    end
    create_table :virtual_direction_estimates do |t|
      t.integer :virtual_direction_test_id
      t.integer :start_landmark_id
      t.integer :facing_landmark_id
      t.integer :target_landmark_id
      t.integer :bearing
      t.timestamps
    end
    create_table :vambler_demographics_records do |t|
      t.integer :participant_id
      t.string :gender
      t.string :ethnic_category
      t.string :racial_category
      t.string :education
      t.string :handedness
      t.string :first_language
      t.text :prescription_meds
      t.text :head_injuries
      t.timestamps
    end
    create_table :virtual_navigation_logs do |t|
      t.references :participant, :index => true
      t.references :virtual_environment, :index => true
      t.string :route
      t.text :log
      t.timestamps
    end
  end
end
