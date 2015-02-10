class TeachersController < ApplicationController
  before_action :check_logged_in

  def index
    @teachers = Teacher.all
    @achievements = Achievement.all
    # @achievements = Achievement.get_assignments_for_student_email( student.student_email )
    @teachers_students = Student.get_all_children_for_teacher_id( session[:teacher_id] )
  end

  def new
    @teacher = Teacher.new
    @achievement = Achievement.new
  end

  def edit_achievements
    @student = Student.find(params[:id])
    @achievements = Achievement.all
  end

  def update_achievements
    @student = Student.find(params[:id])
    @student.achievements = []
    params[:achievements].keys.each do |achievement_id|
      @student.achievements << Achievement.find_by_id(achievement_id)
    end
    redirect_to edit_achievements_student_path
  end

  def edit
  end

  def create

    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def show
    redirect_to teachers_path
  end

  def destroy
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:teacher_id]
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end


end
