class Adult < ActiveRecord::Base
  belongs_to  :family_group, :dependent => true

  before_validation :set_income, :format_rut

  validates_presence_of :fathers_name, :mothers_name, :names, :sex

  validates_inclusion_of :sex, :in => %w{M F}
  
  validates_numericality_of :income

  def fullname
    fathers_name+" "+mothers_name+", "+names
  end

  def self.find_by_name(criteria)
    terms = criteria.split.collect do |word|
      "%#{word.downcase}%" 
    end
    find(:all,
         :conditions => [ ( ["(concat(names, ' ', fathers_name, ' ', mothers_name) LIKE ?)"] * terms.size ).join(" AND "), * terms.flatten ])
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
