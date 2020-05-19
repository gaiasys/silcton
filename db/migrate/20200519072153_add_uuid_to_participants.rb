class AddUuidToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :uuid, :uuid
  end
end
