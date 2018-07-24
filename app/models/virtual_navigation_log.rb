class VirtualNavigationLog < ApplicationRecord
  belongs_to :participant
  belongs_to :virtual_environment

  def number_of_log_lines
    log.lines.count
  end
end
