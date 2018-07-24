class PfRecord < ApplicationRecord
  belongs_to :participant
  
  def score
    score = 0
    
    if q1 == 'a'
      score += 1
    elsif q1.nil?
    else
      score -= 0.2
    end
    
    if q2 == 'd'
      score += 1
    elsif q2.nil?
    else
      score -= 0.2
    end
    
    if q3 == 'b'
      score += 1
    elsif q3.nil?
    else
      score -= 0.2
    end
    
    if q4 == 'd'
      score += 1
    elsif q4.nil?
    else
      score -= 0.2
    end
    
    if q5 == 'b'
      score += 1
    elsif q5.nil?
    else
      score -= 0.2
    end
    
    if q6 == 'e'
      score += 1
    elsif q6.nil?
    else
      score -= 0.2
    end
    
    if q7 == 'a'
      score += 1
    elsif q7.nil?
    else
      score -= 0.2
    end
    
    if q8 == 'c'
      score += 1
    elsif q8.nil?
    else
      score -= 0.2
    end
    
    if q9 == 'e'
      score += 1
    elsif q9.nil?
    else
      score -= 0.2
    end
    
    if q10 == 'e'
      score += 1
    elsif q10.nil?
    else
      score -= 0.2
    end
    
    if q11 == 'c'
      score += 1
    elsif q11.nil?
    else
      score -= 0.2
    end
    
    if q12 == 'b'
      score += 1
    elsif q12.nil?
    else
      score -= 0.2
    end
    
    if q13 == 'a'
      score += 1
    elsif q13.nil?
    else
      score -= 0.2
    end
    
    if q14 == 'e'
      score += 1
    elsif q14.nil?
    else
      score -= 0.2
    end
    
    if q15 == 'b'
      score += 1
    elsif q15.nil?
    else
      score -= 0.2
    end
    
    if q16 == 'a'
      score += 1
    elsif q16.nil?
    else
      score -= 0.2
    end
    
    if q17 == 'e'
      score += 1
    elsif q17.nil?
    else
      score -= 0.2
    end
    
    if q18 == 'd'
      score += 1
    elsif q18.nil?
    else
      score -= 0.2
    end
    
    if q19 == 'd'
      score += 1
    elsif q19.nil?
    else
      score -= 0.2
    end
    
    if q20 == 'c'
      score += 1
    elsif q20.nil?
    else
      score -= 0.2
    end
    
    score
  end
end
