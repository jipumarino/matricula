class Adult < ActiveRecord::Base
  belongs_to  :family_group, :dependent => true

  before_validation :set_income, :format_rut

  def fullname
    fathers_name+" "+mothers_name+", "+names
  end

  def self.find_by_name(criteria)
    find(:all, :conditions => ["concat(names, ' ', fathers_name, ' ', mothers_name, ' ', run) like concat('%', ?, '%')", criteria], :order =>  'fathers_name, mothers_name') unless criteria.nil? or criteria.empty?
  end

  def is_guardian?
    is_guardian
  end

  def is_guardian
    self == self.family_group.guardian
  end

  def set_income
    self.income ||= 0
  end

  def format_rut
    self.run.gsub!(/[.]/,'')
  end
end
