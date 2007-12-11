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
  
  

  def delete
    @fg = FamilyGroup.find(params[:id])
    @fg.destroy
    redirect_to :action => :index 
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
        if @fg.adults.size == 1
          @fg.guardian = @adult
          @fg.save
        end
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
    if request.xhr?
      if params[:search_criteria].strip.length > 2
        @students = Student.find_by_name(params[:search_criteria])
        @adults = Adult.find_by_name(params[:search_criteria])
      end     
      render :partial => "search_list" 
    else    
      redirect_to :action => "index" 
    end
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
                          when 0..99_999:         2000
                          when 100_000..119_999:  3100
                          when 120_000..149_999:  3300
                          when 150_000..199_999:  3800
                          when 200_000..249_999:  4600
                          when 250_000..299_999:  5400
                          else                    6600
                          end

                        when 2
                          case @total_income
                          when 0..99_999:        3000
                          when 100_000..119_999:  4600
                          when 120_000..149_999:  4800
                          when 150_000..199_999:  5700
                          when 200_000..249_999:  6900
                          when 250_000..299_999:  8100
                          else                    9900
                          end

                        else
                          case @total_income
                          when 0..99_999:        4000
                          when 100_000..119_999:  6200
                          when 120_000..149_999:  6500
                          when 150_000..199_999:  7600
                          when 200_000..249_999:  9200
                          when 250_000..299_999:  10800
                          else                    12600
                          end
                        end



    @mensuality_media = case @students_media

                       when 0: 0

                       when 1
                         case @total_income
                         when 0..99_999:        7500
                         when 100_000..119_999:  8900
                         when 120_000..149_999:  9800
                         when 150_000..199_999:  11600
                         when 200_000..249_999:  13000
                         when 250_000..299_999:  15400
                         else                    19200
                         end

                       when 2
                         case @total_income
                         when 0..100_000:        11300
                         when 100_000..119_999:  13400
                         when 120_000..149_999:  14700
                         when 150_000..199_999:  17400
                         when 200_000..249_999:  19500
                         when 250_000..299_999:  23100
                         else                    28800
                         end

                       else
                         case @total_income
                         when 0..100_000:        14500
                         when 100_000..119_999:  17800
                         when 120_000..149_999:  19600
                         when 150_000..199_999:  23200
                         when 200_000..249_999:  26000
                         when 250_000..299_999:  30800
                         else                    38400
                         end
                       end

    @mensuality = @mensuality_basic + @mensuality_media

    render :layout => false
  end




end
