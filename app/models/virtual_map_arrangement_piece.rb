class VirtualMapArrangementPiece < ApplicationRecord
  belongs_to :virtual_map_arrangement
  belongs_to :virtual_landmark
  
  def error
    Math.sqrt((upper_left_pixel_x - virtual_landmark.piece_upper_left_pixel_x)**2 + (upper_left_pixel_y - virtual_landmark.piece_upper_left_pixel_y)**2)
  end
end
