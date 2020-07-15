class AddLatestIdentificationToStudies < ActiveRecord::Migration[5.1]
  def change
    add_column :studies, :latest_identification, :string
  end
end
