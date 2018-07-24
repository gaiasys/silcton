class ParticipantLogEntry < LogEntry
  belongs_to :participant, :foreign_key => "user_id"
end