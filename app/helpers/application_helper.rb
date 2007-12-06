# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tabular_form_for(name, *args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}
    options = options.merge(:builder => TabularBuilder)
    args = (args << options)
    form_for(name, *args, &block)
  end


end

