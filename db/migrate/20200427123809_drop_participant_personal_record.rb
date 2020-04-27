class DropParticipantPersonalRecord < ActiveRecord::Migration[5.1]
  def change
    drop_table :participant_personal_records
  end
end
