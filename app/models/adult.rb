class Adult < ActiveRecord::Base
  belongs_to  :family_group, :dependent => :destroy
  belongs_to  :editor, :class_name => "User", :foreign_key => "updated_by"

  before_validation :set_income, :format_rut
  after_validation :titleize_name

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

  def titleize_name
    self.names = self.names.titleize
    self.fathers_name = self.fathers_name.titleize
    self.mothers_name = self.mothers_name.titleize
  end
    
end
