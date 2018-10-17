class InstrumentInStudy < ApplicationRecord
  belongs_to :study, optional: true
  def self.order_greater_or_equal_to(order_id)
    order(:order).where('instrument_in_studies.order >= ?', order_id).first
  end
  def find_by_order(number)
    found_record = super(number)
    if found_record
      found_record
    else
      super(number + 1)
    end
  end
end
