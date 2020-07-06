class AddPilotSubjectToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :pilot_subject, :boolean, default: false
  end
end
