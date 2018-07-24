class VirtualMapArrangement < ApplicationRecord
  belongs_to :participant
  belongs_to :virtual_environment
  has_many :virtual_map_arrangement_pieces, -> { order("placement_order ASC") }, :dependent => :destroy
  
  def total_error
    total_error = 0
    virtual_map_arrangement_pieces.each { |piece| total_error += piece.error }
    total_error
  end
  
  def average_error
    average_error = total_error / virtual_map_arrangement_pieces.length
  end
end
