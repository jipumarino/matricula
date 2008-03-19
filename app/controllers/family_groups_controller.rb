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
    @casa_mujer = @fg.survey.casa_mujer?

    @students = @students_basic+@students_media
    
    @mensuality_basic = @fg.mensuality_basic
    @mensuality_media = @fg.mensuality_media

    @mensuality = @fg.mensuality
  
    render :layout => false
  end




end
