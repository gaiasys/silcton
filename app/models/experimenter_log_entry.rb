class ExperimenterLogEntry < LogEntry
  belongs_to :experimenter, :foreign_key => "user_id"
end