class ChangeLogTextLimit < ActiveRecord::Migration[5.1]
  def change
    change_column :virtual_navigation_logs, :log, :text, limit: 5.megabytes - 1
  end
end
