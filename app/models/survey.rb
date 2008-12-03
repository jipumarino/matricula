class Survey < ActiveRecord::Base
  has_one :family_group
  Belonging = [['Propia','own'],['Arrendada','rented'],['Cedida','yield'],['Otro','other']]

  def before_save
    self.payment_amount ||=0

  end
end
