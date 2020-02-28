class AddErrorFieldToVirtualDirectionEstimate < ActiveRecord::Migration[5.1]
  def change
    add_column :virtual_direction_estimates, :error, :boolean, default: false
    VirtualDirectionEstimate.update_all(error: true)
  end
end
