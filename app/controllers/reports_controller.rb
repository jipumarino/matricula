class ReportsController < ApplicationController
  def level
    @students = Student.find_all_by_next_level(params[:student][:level], :order => 'fathers_name, mothers_name')
  end

  def total
    @students = {}
    levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    levels.each do |l|
      @students[l] = Student.find_all_by_next_level(l, :order => 'next_level, fathers_name, mothers_name')
    end

    render :layout => 'print'
  end

  def summary
    @students_amounts = {}
    levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    levels.each do |l|
      @students_amounts[l] = Student.find_all_by_next_level(l, :order => 'next_level, fathers_name, mothers_name').size
    end
  end

end
