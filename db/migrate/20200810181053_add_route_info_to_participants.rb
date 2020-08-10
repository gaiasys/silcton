class AddRouteInfoToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :route_info, :jsonb, default: {}
  end
end
