class PsasRecord < ApplicationRecord
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
    return nil if length.empty? or length.nil?

    total_score = reverse_code(q1.to_i) + reverse_code(q2.to_i) + reverse_code(q3.to_i) + reverse_code(q4.to_i) + q5.to_i + reverse_code(q6.to_i) + q7.to_i + reverse_code(q8.to_i) + q9.to_i + reverse_code(q10.to_i) + reverse_code(q11.to_i) + reverse_code(q12.to_i) + reverse_code(q13.to_i) + reverse_code(q14.to_i) + reverse_code(q15.to_i) + reverse_code(q16.to_i)
    if length == 'long'
      total_score += reverse_code(q17.to_i) + reverse_code(q18.to_i) + reverse_code(q19.to_i) + reverse_code(q20.to_i) + q21.to_i + reverse_code(q22.to_i) + q23.to_i + q24.to_i + reverse_code(q25.to_i)
    end
    return total_score
  end
  
  def average_score
    if length == 'short'
      average_score = total_score / 16.0
    elsif length == 'long'
      average_score = total_score / 25.0
    end
  end
end
