class MrtRecord < ApplicationRecord
  belongs_to :participant

  def sdt_score
    q1_score = case q1
      when 'ac' then 4
      when 'bd' then -4
      when 'a' then 2
      when 'c' then 2
      when 'b' then -2
      when 'd' then -2
      else 0
    end

    q5_score = case q5
      when 'ac' then 4 
      when 'bd' then -4 
      when 'a' then 2 
      when 'c' then 2 
      when 'b' then -2 
      when 'd' then -2 
    	else 0
    end

    q17_score = case q17
      when 'ac' then 4 
      when 'bd' then -4 
      when 'a' then 2 
      when 'c' then 2 
      when 'b' then -2 
      when 'd' then -2 
    	else 0
    end

    q2_score = case q2
      when 'ad' then 4 
      when 'bc' then -4 
      when 'a' then 2 
      when 'd' then 2 
      when 'b' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q6_score = case q6
      when 'ad' then 4
      when 'bc' then -4 
      when 'a' then 2 
      when 'd' then 2 
      when 'b' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q10_score = case q10
      when 'ad' then 4 
      when 'bc' then -4 
      when 'a' then 2 
      when 'd' then 2 
      when 'b' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q14_score = case q14
      when 'ad' then 4 
      when 'bc' then -4 
      when 'a' then 2 
      when 'd' then 2 
      when 'b' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q18_score = case q18
      when 'ad' then 4 
      when 'bc' then -4 
      when 'a' then 2 
      when 'd' then 2 
      when 'b' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q3_score = case q3
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q7_score = case q7
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
      else 0
    end
    
    q9_score = case q9
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
      else 0
    end
    
    q11_score = case q11
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
      else 0
    end
    
    q12_score = case q12
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
      else 0
    end
    
    q13_score = case q13
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
     else 0
    end
    
    q15_score = case q15
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
      else 0
    end
    
    q19_score = case q19
      when 'bd' then 4 
      when 'ac' then -4 
      when 'b' then 2 
      when 'd' then 2 
      when 'a' then -2 
      when 'c' then -2 
    	else 0     
    end
    
    q4_score = case q4
      when 'bc' then 4 
      when 'ad' then -4 
      when 'b' then 2 
      when 'c' then 2 
      when 'a' then -2 
      when 'd' then -2 
    	else 0    
    end
    
    q8_score = case q8
      when 'bc' then 4 
      when 'ad' then -4 
      when 'b' then 2 
      when 'c' then 2 
      when 'a' then -2 
      when 'd' then -2 
      else 0
    end
    
    q16_score = case q16
      when 'bc' then 4 
      when 'ad' then -4 
      when 'b' then 2 
      when 'c' then 2 
      when 'a' then -2 
      when 'd' then -2 
      else 0
    end
    
    q20_score = case q20
      when 'bc' then 4 
      when 'ad' then -4 
      when 'b' then 2 
      when 'c' then 2 
      when 'a' then -2 
      when 'd' then -2 
      else 0
    end
    
    sdt_score = q1_score + q2_score + q3_score + q4_score + q5_score + q6_score + q7_score + q8_score + q9_score + q10_score + q11_score + q12_score + q13_score + q14_score + q15_score + q16_score + q17_score + q18_score + q19_score + q20_score
  end
end
