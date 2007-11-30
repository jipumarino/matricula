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
    students.select{|s| s.next_level =~ /.B/}.size
  end
  
  def total_income
    adults.inject(0){|sum, a| sum+a.income}
  end
end


