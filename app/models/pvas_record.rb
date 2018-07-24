class PvasRecord < ApplicationRecord
  belongs_to :participant
  
  def reverse_code (input)
    reverse = case input
      when 1 then 7
      when 2 then 6
      when 3 then 5
      when 4 then 4
      when 5 then 3
      when 6 then 2
      when 7 then 1
    end
  end
  
  def total_score
    total_score = reverse_code(q1.to_i) + reverse_code(q2.to_i) + q3.to_i + reverse_code(q4.to_i) + reverse_code(q5.to_i) + reverse_code(q6.to_i) + q7.to_i + reverse_code(q8.to_i) + q9.to_i + reverse_code(q10.to_i) # oops, I made these string columns
  end
  
  def average_score
    average_score = total_score / 10.0
  end

end
