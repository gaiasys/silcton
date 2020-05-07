class AddParticipantPersonalRecord < ActiveRecord::Migration[5.1]
  def change

    create_table :participant_personal_records do |t|
      t.integer :participant_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end

  end
end
