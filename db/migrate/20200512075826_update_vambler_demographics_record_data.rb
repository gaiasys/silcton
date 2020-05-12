class UpdateVamblerDemographicsRecordData < ActiveRecord::Migration[5.1]
  def change
    VamblerDemographicsRecord.update_all(prescription_meds: nil, head_injuries: nil)
  end
end
