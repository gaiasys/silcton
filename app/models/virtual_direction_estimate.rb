class VirtualDirectionEstimate < ApplicationRecord
  belongs_to :virtual_direction_test
  belongs_to :start_landmark, :class_name => "VirtualLandmark"
  belongs_to :facing_landmark, :class_name => "VirtualLandmark"
  belongs_to :target_landmark, :class_name => "VirtualLandmark"

  def true_direction
    # from pointing location to front door
    # http://en.wikipedia.org/wiki/Law_of_cosines#Applications
    # C = start landmark pointing location, B = target landmark front door, A = facing_landmark pointing location
    #a = start_landmark.distance_to(facing_landmark, "pointing_location", "pointing_location") #CA
    #b = start_landmark.distance_to(target_landmark, "pointing_location", "front_door") #CB
    #c = target_landmark.distance_to(facing_landmark, "front_door", "pointing_location") #BA
    #angle = Math.acos((a**2 + b**2 - c**2) / (2 * a * b))
    #

    facing = Matrix[[facing_landmark.pointing_location_pixel_x,facing_landmark.pointing_location_pixel_y]]
    point_from = Matrix[[start_landmark.pointing_location_pixel_x,start_landmark.pointing_location_pixel_y]]
    target = Matrix[[start_landmark.front_door_pixel_x,start_landmark.front_door_pixel_y]]
    #vector subtraction logic from here:
    #https://stackoverflow.com/questions/21483999/using-atan2-to-find-angle-between-two-vectors
    vector1 = facing-point_from # center the facing and target points
    vector2 = target-point_from
    # Now calculate the signed angle between them as the difference between arctans (y,x)
    angle = Math.arctan2(vector1[1],vector1[0]) - np.arctan2(vector2[1],vector2[0])
    return rad2deg(angle)

  end

  def abs_error
    abs_error = (bearing - true_direction).modulo(360)
    if abs_error > 180
      abs_error = 360 - abs_error
    else
      abs_error
    end
  end

  def rad2deg(r)
    r * 180 / Math::PI
  end
end
