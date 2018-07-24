class VirtualRoute < ApplicationRecord
  has_many :virtual_landmarks, -> { order("visit_order ASC") }
end
