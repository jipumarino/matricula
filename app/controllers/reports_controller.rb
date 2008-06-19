class ReportsController < ApplicationController
  before_filter :require_authentication

  def level
    @level = params[:student][:level]
    @students = Student.find_all_by_next_level(@level, :order => 'section, fathers_name, mothers_name')
  end

  def level_update
    @level = params[:level]
    @students = Student.find_all_by_next_level(@level)
    @students.each{ |s| s.attributes = params[:s][s.id.to_s]}
    @students.each(&:save)
    redirect_to :action => 'index'
  end
  
  
  def total_by_level
    @students = {}
    levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    levels.each do |l|
      @students[l] = Student.find_all_by_next_level(l, :order => 'next_level, fathers_name, mothers_name')
    end

    render :layout => 'print'
  end

  def total_by_section
    @students = {}
    levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    sections = %w{A B C D}
    levels.each do |l|
      @students[l]= {}
      sections.each do |s|
        @students[l][s] = Student.find_all_by_next_level_and_section(l, s, :order => 'next_level, section, fathers_name, mothers_name')
      end
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
  
def payments_book
    @students = {}
    @levels = %w{PK K 1B 2B 3B 4B 5B 6B 7B 8B 1M 2M 3M 4M}
    @sections = [""]+%w{A B C D}
    @levels.each do |l|
      @students[l]= {}
      @sections.each do |s|
        @students[l][s] = Student.find_all_by_next_level_and_section(l, s, :order => 'next_level, section, fathers_name, mothers_name')
      end
    end
    render :layout => 'print'
  
end
    
  

end
