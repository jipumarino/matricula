class FamilyGroup < ActiveRecord::Base
  belongs_to  :survey
  has_many    :adults
  has_many    :students
  belongs_to  :guardian, :class_name => "Adult", :foreign_key => "guardian_id"
  has_many    :addresses

  def has_guardian?
    not self.guardian.nil?
  end

  def has_survey?
    not survey.nil?
  end

  def students_media
    students.select{|s| s.next_level =~ /.M/}.size
  end
  
  def students_basic
    students.select{|s| s.next_level =~ /.B/ or s.next_level == "K"}.size
  end
  
  def total_income
    adults.inject(0){|sum, a| sum+a.income}
  end
  
  def mensuality_basic
    
    return 1000*students_basic if has_survey? and survey.casa_mujer?
    
    case students_basic

    when 0: 0

    when 1
      case @total_income
      when 0..99_999:         2000
      when 100_000..119_999:  3100
      when 120_000..149_999:  3300
      when 150_000..199_999:  3800
      when 200_000..249_999:  4600
      when 250_000..299_999:  5400
      else                    6600
      end

    when 2
      case @total_income
      when 0..99_999:        3000
      when 100_000..119_999:  4600
      when 120_000..149_999:  4800
      when 150_000..199_999:  5700
      when 200_000..249_999:  6900
      when 250_000..299_999:  8100
      else                    9900
      end

    else
      case @total_income
      when 0..99_999:        4000
      when 100_000..119_999:  6200
      when 120_000..149_999:  6500
      when 150_000..199_999:  7600
      when 200_000..249_999:  9200
      when 250_000..299_999:  10800
      else                    12600
      end
    end


  end

  def mensuality_media 
    
    return 1000*students_media if has_survey? and survey.casa_mujer?
    
    case students_media

    when 0: 0

    when 1
      case @total_income
      when 0..99_999:        7500
      when 100_000..119_999:  8900
      when 120_000..149_999:  9800
      when 150_000..199_999:  11600
      when 200_000..249_999:  13000
      when 250_000..299_999:  15400
      else                    19200
      end

    when 2
      case @total_income
      when 0..100_000:        11300
      when 100_000..119_999:  13400
      when 120_000..149_999:  14700
      when 150_000..199_999:  17400
      when 200_000..249_999:  19500
      when 250_000..299_999:  23100
      else                    28800
      end

    else
      case @total_income
      when 0..100_000:        14500
      when 100_000..119_999:  17800
      when 120_000..149_999:  19600
      when 150_000..199_999:  23200
      when 200_000..249_999:  26000
      when 250_000..299_999:  30800
      else                    38400
      end
    end

  end
  
  def mensuality 
    mensuality_basic+mensuality_media
  end

  def lesser_sibling
    levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    students.sort{|x,y| levels.index(x.next_level) <=> levels.index(y.next_level)}.first
  end
  
end
