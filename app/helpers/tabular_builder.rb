class TabularBuilder < ActionView::Helpers::FormBuilder
  def text_field(label, method, options={})
    if method.is_a?(Array)
      tabular(label, method.map{|m| super(m, options)}.join("<br />"))
    else
      tabular(label, super(method, options))
    end
  end

  def date_select(label, method, options={})
    tabular(label, super(method, options))
  end

  def radio_buttons(label, method, choices, options={})
    tabular(label, choices.map{|c| c.first +  radio_button(method, c.last, options)}.join(" "))
  end

  def select(label, method, choices, options ={}, html_options={})
    tabular(label,super(method, choices, options, html_options))
  end

  def text_fields(label, methods, options={})
    tabular(label, methods.map{|m| self.superclass.text_field(m, options)}.join("<br />"))
  end

  private

  def tabular(label, control)
    @template.content_tag("tr",
                          @template.content_tag("td", label)+
                          @template.content_tag("td", control))
  end

end








