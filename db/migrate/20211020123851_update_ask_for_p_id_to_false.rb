class UpdateAskForPIdToFalse < ActiveRecord::Migration[5.1]
  def change
    Study.update_all(ask_participant_id: false)
  end
end
