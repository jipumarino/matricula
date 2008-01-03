class ReportsController < ApplicationController
  def level
    @students = Student.find_all_by_next_level(params[:student][:level], :order => 'fathers_name, mothers_name')
  end
end
