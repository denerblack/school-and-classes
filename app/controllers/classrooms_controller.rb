class ClassroomsController < ApplicationController
  respond_to :html, :json
  before_action :load_course,  only: :create
  before_action :load_student, only: :create

  def index
    @students = Student.all
    @courses  = Course.all

    respond_to do |format|
      format.json { render json: Classroom.all }
      format.html
    end
  end

  def create
    puts @course
    puts @student.name
    respond_with Classroom.create!(
      student: @student,
      course: @course
    )
  end

  def destroy
    respond_with Classroom.destroy params[:id]
  end

  def classrooms_params
    params.require(:classroom).permit(course: [:id, :name], student: [:id, :name])
  end

  private

  def load_course
    @course = Course.find classrooms_params[:course][:id]
  end

  def load_student
    @student = Student.find classrooms_params[:student][:id]
  end
end
