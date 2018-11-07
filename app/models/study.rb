class Study < ApplicationRecord
  belongs_to :lab
  belongs_to :experimenter
  has_many :instrument_in_studies, -> { order(order: :asc) }, dependent: :destroy
  has_many :participants, -> { order(created_at: :desc) }, dependent: :destroy
  before_save :set_buttons_to_vambler
  validates_presence_of :name, :lab, :experimenter

  accepts_nested_attributes_for :instrument_in_studies, :allow_destroy => true

  after_initialize :default_values
  def default_values
    self.ask_participant_id ||= true
  end

  def last_administered
    if p = participants.first
      p.created_at
    else
      return nil
    end
  end
  def set_buttons_to_vambler
    kind_of_start_buttons = 'vambler'
  end
end

