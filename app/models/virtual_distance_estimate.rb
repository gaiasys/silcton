class VirtualDistanceEstimate < ApplicationRecord
  belongs_to :virtual_distance_test
  belongs_to :start_landmark, :class_name => "VirtualLandmark"
  belongs_to :target_landmark, :class_name => "VirtualLandmark"
  belongs_to :anchor_landmark, :class_name => "VirtualLandmark"
end
