class Student < ActiveRecord::Base
  belongs_to  :family_group, :dependent => true
  belongs_to  :father, :class_name => "Adult", :foreign_key => "father_id"
  belongs_to  :mother, :class_name => "Adult", :foreign_key => "mother_id"

  before_validation :format_run

  validates_presence_of :fathers_name, :mothers_name, :names, :sex, :next_level

  validates_inclusion_of :sex, :in => %w{M F}

  def fullname
    fathers_name+" "+mothers_name+", "+names
  end

  def self.find_by_name(criteria)
    find(:all, :conditions => ["concat(names, ' ', fathers_name, ' ', mothers_name, ' ', run) like concat('%', ?, '%')", criteria], :order =>  'fathers_name, mothers_name') unless criteria.nil? or criteria.empty?
  end

  def format_run
    self.run.gsub!(/[.]/,'')
  end
    
end
