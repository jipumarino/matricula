module FamilyGroupsHelper
  def grade_format(level)
    level.gsub("B", "° Básico").gsub("M", "° Medio").gsub("P", "Pre-").gsub("K", "Kinder")
  end

  def dinero(num)
    number_to_currency(num, :precision => 0, :unit => "$", :separator => ",", :delimiter => ".")
  end

  def run(run)
    number_with_delimiter(run.chop, ".")+run.last
  end

  def levels_choices
    %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}.map{|l| [grade_format(l), l]}
  end

  def educational_levels_choices
    %w{EB12 EB34 EB56 EB78 EM12 EM34 ES12 ES34 ES56}.map{|l| [l.gsub('E','').gsub('B', 'Básica ').gsub('M', 'Media ').gsub('S', 'Superior ').gsub(/([0-9])([0-9])/,'\1°-\2°'),l]}
  end
end
