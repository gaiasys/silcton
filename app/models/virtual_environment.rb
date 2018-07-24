class VirtualEnvironment < ApplicationRecord
  has_many :virtual_landmarks, -> { order("visit_order ASC") }
  has_many :virtual_routes
  has_many :virtual_map_arrangements
  has_many :virtual_distance_tests
  has_many :virtual_direction_tests
  def virtual_landmarks
    @virtual_landmarks ||= super
  end
end
