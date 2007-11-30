class FamilyGroupsController < ApplicationController

  def edit
    @fg = FamilyGroup.find(params[:id])
    @adults = @fg.adults
    @students = @fg.students
    @addresses = @fg.addresses
    @survey = @fg.survey
  end

  def index
  end

  def create
    @fg = FamilyGroup.new
    @fg.save
    redirect_to :action => 'edit', :id => @fg
  end

  def set_guardian
    @a = Adult.find(params[:id])
    @fg = @a.family_group
    @fg.guardian = @a
    @fg.save
    redirect_to :action => :edit, :id => @fg
  end

  def edit_address
    @address = Address.find(params[:id])
    @address.update_attributes(params[:address])
    @fg = @address.family_group
    if request.post?
      if @address.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def edit_student
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    @fg = @student.family_group
    if request.post?
      if @student.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def add_student
    @fg = FamilyGroup.find(params[:id])
    @student = Student.new(params[:student])
    @student.family_group = @fg
    if request.post?
      if @student.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def add_address
    @fg = FamilyGroup.find(params[:id])
    @address = Address.new(params[:address])
    @address.family_group = @fg
    if request.post?
      if @address.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def edit_adult
    @adult = Adult.find(params[:id])
    @adult.update_attributes(params[:adult])
    @fg = @adult.family_group
    if request.post?
      if @adult.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def add_adult
    @fg = FamilyGroup.find(params[:id])
    @adult = Adult.new(params[:adult])
    @adult.family_group = @fg
    if request.post?
      if @adult.save
        redirect_to :action => :edit, :id => @fg
      end
    end
  end

  def take_survey
    @fg = FamilyGroup.find(params[:id])
    @survey = Survey.new(params[:survey])
    if request.post?
      if @survey.save
        @fg.survey = @survey
        @fg.save
        redirect_to :action => 'edit', :id => @fg
      end
    end
  end

  def edit_survey
    @fg = FamilyGroup.find(params[:id])
    @survey = @fg.survey
    if request.post?
      if @survey.update_attributes(params[:survey])
        redirect_to :action => 'edit', :id => @fg
      end
    end
  end

  def print_ticket
    @fg = FamilyGroup.find(params[:id])
  end

  def cancel_creation
    @fg = FamilyGroup.find(params[:id])
    @fg.destroy
    redirect_to :action => 'index'
  end

  def find_person
    @students = Student.find_by_name(params[:search_criteria])
    @adults = Adult.find_by_name(params[:search_criteria])
    render :action => 'index'
  end

  def delete_address
    a = Address.find(params[:id])
    fg = a.family_group
    a.destroy
    redirect_to :action => 'edit', :id => fg
  end

  def delete_adult
    a = Adult.find(params[:id])
    fg = a.family_group
    a.destroy
    redirect_to :action => 'edit', :id => fg
  end

  def delete_student
    s = Student.find(params[:id])
    fg = s.family_group
    s.destroy
    redirect_to :action => 'edit', :id => fg
  end

  def delete
    fg = FamilyGroup.find(params[:id])
    fg.destroy
    redirect_to :action => 'index'
  end

  def print_ticket
    @fg = FamilyGroup.find(params[:id])
    @guardian = @fg.guardian
    @adults = @fg.adults
    @students_basic = @fg.students_basic
    @students_media = @fg.students_media
    @total_income = @fg.total_income

    @mensuality_basic = case @students_basic

                        when 0: 0

                        when 1
                          case @total_income
                          when 0..100_000:        1900
                          when 100_001..120_000:  2900
                          when 120_001..150_000:  3100
                          when 150_001..200_000:  3600
                          when 200_001..250_000:  4400
                          when 250_001..300_000:  5100
                          else                    6300
                          end

                        when 2
                          case @total_income
                          when 0..100_000:        2900
                          when 100_001..120_000:  4400
                          when 120_001..150_000:  4700
                          when 150_001..200_000:  5400
                          when 200_001..250_000:  6600
                          when 250_001..300_000:  7300
                          else                    9500
                          end

                        else
                          case @total_income
                          when 0..100_000:        3800
                          when 100_001..120_000:  5800
                          when 120_001..150_000:  6200
                          when 150_001..200_000:  7200
                          when 200_001..250_000:  8800
                          when 250_001..300_000:  10200
                          else                    12600
                          end
                        end



    @mensuality_media = case @students_media

                       when 0: 0

                       when 1
                         case @total_income
                         when 0..100_000:        7200
                         when 100_001..120_000:  8500
                         when 120_001..150_000:  9800
                         when 150_001..200_000:  11000
                         when 200_001..250_000:  12400
                         when 250_001..300_000:  14700
                         else                    18400
                         end

                       when 2
                         case @total_income
                         when 0..100_000:        10800
                         when 100_001..120_000:  12800
                         when 120_001..150_000:  14700
                         when 150_001..200_000:  16500
                         when 200_001..250_000:  18600
                         when 250_001..300_000:  22100
                         else                    27600
                         end

                       else
                         case @total_income
                         when 0..100_000:        14400
                         when 100_001..120_000:  17000
                         when 120_001..150_000:  19600
                         when 150_001..200_000:  22200
                         when 200_001..250_000:  24800
                         when 250_001..300_000:  29400
                         else                    36800
                         end
                       end

    @mensuality = @mensuality_basic + @mensuality_media

    render :layout => false
  end




end
