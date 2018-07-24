class VirtualDistanceTest < ApplicationRecord
  belongs_to :participant
  belongs_to :virtual_environment
  has_many :virtual_distance_estimates, :dependent => :destroy
end
