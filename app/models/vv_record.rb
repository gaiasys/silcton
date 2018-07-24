class VvRecord < ApplicationRecord
  belongs_to :participant

  def score
    correct = 0
    incorrect = 0

    if q1 == 'f'
      correct += 1
    elsif q1.nil?
    else
      incorrect += 1
    end

    if q2 == 'b'
      correct += 1
    elsif q2.nil?
    else
      incorrect += 1
    end

    if q3 == 'c'
      correct += 1
    elsif q3.nil?
    else
      incorrect += 1
    end
    
    if q4 == 'g'
      correct += 1
    elsif q4.nil?
    else
      incorrect += 1
    end
    
    if q5 == 'e'
      correct += 1
    elsif q5.nil?
    else
      incorrect += 1
    end
    
    if q6 == 'f'
      correct += 1
    elsif q6.nil?
    else
      incorrect += 1
    end
    
    if q7 == 'c'
      correct += 1
    elsif q7.nil?
    else
      incorrect += 1
    end
    
    if q8 == 'b'
      correct += 1
    elsif q8.nil?
    else
      incorrect += 1
    end
    
    if q9 == 'e'
      correct += 1
    elsif q9.nil?
    else
      incorrect += 1
    end
    
    if q10 == 'a'
      correct += 1
    elsif q10.nil?
    else
      incorrect += 1
    end
    
    if q11 == 'c'
      correct += 1
    elsif q11.nil?
    else
      incorrect += 1
    end
    
    if q12 == 'g'
      correct += 1
    elsif q12.nil?
    else
      incorrect += 1
    end
    
    if q13 == 'f'
      correct += 1
    elsif q13.nil?
    else
      incorrect += 1
    end
    
    if q14 == 'e'
      correct += 1
    elsif q14.nil?
    else
      incorrect += 1
    end
    
    if q15 == 'c'
      correct += 1
    elsif q15.nil?
    else
      incorrect += 1
    end
    
    if q16 == 'a'
      correct += 1
    elsif q16.nil?
    else
      incorrect += 1
    end
    
    if q17 == 'g'
      correct += 1
    elsif q17.nil?
    else
      incorrect += 1
    end
    
    if q18 == 'c'
      correct += 1
    elsif q18.nil?
    else
      incorrect += 1
    end
    
    if q19 == 'b'
      correct += 1
    elsif q19.nil?
    else
      incorrect += 1
    end
    
    if q20 == 'a'
      correct += 1
    elsif q20.nil?
    else
      incorrect += 1
    end
    
    if q21 == 'e'
      correct += 1
    elsif q21.nil?
    else
      incorrect += 1
    end
    
    if q22 == 'g'
      correct += 1
    elsif q22.nil?
    else
      incorrect += 1
    end

    if q23 == 'f'
      correct += 1
    elsif q23.nil?
    else
      incorrect += 1
    end

    if q24 == 'e'
      correct += 1
    elsif q24.nil?
    else
      incorrect += 1
    end

    score = correct + (incorrect / 6)
  end
end
