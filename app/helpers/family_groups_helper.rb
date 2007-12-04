module FamilyGroupsHelper
  def grade_format(level)
    level.gsub("B", "&deg; Básico").gsub("M", "&deg; Medio").gsub("P", "Pre-").gsub("K", "Kinder")
  end

  def dinero(num)
    number_to_currency(num, :precision => 0, :unit => "$", :separator => ",", :delimiter => ".")
  end

  def run(run)
    number_with_delimiter(run.chop, ".")+run.last
  end
end
