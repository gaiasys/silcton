class VirtualDirectionTest < ApplicationRecord
  belongs_to :participant
  belongs_to :virtual_environment
  has_many :virtual_direction_estimates, :dependent => :destroy
end
