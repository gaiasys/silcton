class UpdateErrorValueOfVirtualDirectionEstimate < ActiveRecord::Migration[5.1]
  def change
    VirtualDirectionEstimate.update_all(error: true)
  end
end
