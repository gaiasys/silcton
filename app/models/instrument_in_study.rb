class InstrumentInStudy < ApplicationRecord
  belongs_to :study, optional: true

  def find_by_order(number)
    found_record = super(number)
    if found_record
      found_record
    else
      super(number + 1)
    end
  end
end
