class FamilyGroup < ActiveRecord::Base
  belongs_to  :survey
  has_many    :adults
  has_many    :students
  belongs_to  :guardian, :class_name => "Adult", :foreign_key => "guardian_id"
  belongs_to  :editor, :class_name => "User", :foreign_key => "updated_by"
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
      case total_income
      when 0..99_999:         2200
      when 100_000..119_999:  3400
      when 120_000..149_999:  3600
      when 150_000..199_999:  4200
      when 200_000..249_999:  5100
      when 250_000..299_999:  5900
      else                    7300
      end

    when 2
      case total_income
      when 0..99_999:         3300
      when 100_000..119_999:  5100
      when 120_000..149_999:  5300
      when 150_000..199_999:  6300
      when 200_000..249_999:  7600
      when 250_000..299_999:  8900
      else                   11000
      end

    else
      case total_income
      when 0..99_999:         4400
      when 100_000..119_999:  6800
      when 120_000..149_999:  7200
      when 150_000..199_999:  8400
      when 200_000..249_999: 10200
      when 250_000..299_999: 11800
      else                   14600
      end
    end


  end

  def mensuality_media 
    
    return 1000*students_media if has_survey? and survey.casa_mujer?
    
    case students_media

    when 0: 0

    when 1
      case total_income
      when 0..99_999:         8300
      when 100_000..119_999:  9800
      when 120_000..149_999: 10800
      when 150_000..199_999: 12800
      when 200_000..249_999: 14300
      when 250_000..299_999: 17000
      else                   21100
      end

    when 2
      case total_income
      when 0..100_000:       12500
      when 100_000..119_999: 14700
      when 120_000..149_999: 16200
      when 150_000..199_999: 19200
      when 200_000..249_999: 21500
      when 250_000..299_999: 25500
      else                   31650
      end

    else
      case total_income
      when 0..100_000:       16600
      when 100_000..119_999: 19600
      when 120_000..149_999: 21600
      when 150_000..199_999: 25600
      when 200_000..249_999: 28600
      when 250_000..299_999: 34000
      else                   42000
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
  
  def before_save
    self.editor=@current_user
  end

end
