# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tabular_form_for(name, *args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}
    options = options.merge(:builder => TabularBuilder)
    args = (args << options)
    form_for(name, *args, &block)
  end

  def grade_format(level)
    level.gsub("B", "° Básico").gsub("M", "° Medio").gsub("P", "Pre-").gsub("K", "Kinder")
  end

  def run(run)
    number_with_delimiter(run.chop, ".")+run.last
  end

  def levels
    %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
  end

  def levels_choices
    levels.map{|l| [grade_format(l), l]}
  end
  
  def sections
    %w{A B C D}
  end
  
  def sections_choices
    sections.map{|l| [l,l]}
  end

end

