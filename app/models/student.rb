class Student < ActiveRecord::Base
  belongs_to  :family_group, :dependent => true
  belongs_to  :father, :class_name => "Adult", :foreign_key => "father_id"
  belongs_to  :mother, :class_name => "Adult", :foreign_key => "mother_id"

  def fullname
    fathers_name+" "+mothers_name+", "+names
  end

  def self.find_by_name(criteria)
    find(:all, :conditions => ["concat(names, ' ', fathers_name, ' ', mothers_name, ' ', run) like concat('%', ?, '%')", criteria], :order =>  'fathers_name, mothers_name') unless criteria.nil? or criteria.empty?
  end
    
end