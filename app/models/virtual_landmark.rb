class VirtualLandmark < ApplicationRecord
  belongs_to :virtual_environment
  belongs_to :virtual_route
  
  def next_landmark_on_route
    next_visit_order = visit_order + 1
    if next_landmark = virtual_route.virtual_landmarks.find_by_visit_order(next_visit_order)
      next_landmark
    else
      next_landmark = virtual_route.virtual_landmarks.first
    end
  end

  def furthest_landmark
    furthest_landmark = nil
    furthest_distance = 0
    virtual_environment.virtual_landmarks.each do |target_landmark|
      if distance_to(target_landmark, "front_door", "front_door") > furthest_distance
        furthest_landmark = target_landmark
        furthest_distance = distance_to(target_landmark, "front_door", "front_door")
      end
    end
    furthest_landmark
  end
  
  def distance_to (target_landmark, from, to)
    if from == "front_door"
      from_x = front_door_pixel_x
      from_y = front_door_pixel_y
    elsif from == "pointing_location"
      from_x = pointing_location_pixel_x
      from_y = pointing_location_pixel_y
    elsif from == "piece_upper_left_pixel"
      from_x = piece_upper_left_pixel_x
      from_y = piece_upper_left_pixel_y
    end
    
    if to == "front_door"
      to_x = target_landmark.front_door_pixel_x
      to_y = target_landmark.front_door_pixel_y
    elsif to == "pointing_location"
      to_x = target_landmark.pointing_location_pixel_x
      to_y = target_landmark.pointing_location_pixel_y
    elsif to == "piece_upper_left_pixel"
      to_x = target_landmark.piece_upper_left_pixel_x
      to_y = target_landmark.piece_upper_left_pixel_y
    end
    
    Math.sqrt((from_x - to_x)**2 + (from_y - to_y)**2) 
  end
  
  def same_or_different_route (other_landmark)
    if virtual_route == other_landmark.virtual_route
      return "same"
    else
      return "different"
    end
  end
end
