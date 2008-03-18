module FamilyGroupsHelper
  def dinero(num)
    number_to_currency(num, :precision => 0, :unit => "$", :separator => ",", :delimiter => ".")+".-"
  end

  def educational_levels_choices
    %w{EB12 EB34 EB56 EB78 EM12 EM34 ES12 ES34 ES56}.map{|l| [l.gsub('E','').gsub('B', 'Básica ').gsub('M', 'Media ').gsub('S', 'Superior ').gsub(/([0-9])([0-9])/,'\1°-\2°'),l]}
  end
end
