class CoursesController < ApplicationController
  before_action :is_admin, only: %i(edit update create)
  before_action :load_course, except: %i(index new create)
  def index
    @q = Course.ransack(params[:q])
    @pagy, @courses = pagy(@q.result(distinct: true), items: 6)
  end

  def show
    @course = Course.find_by id: params[:id]
    @lessons = @course.lessons.all
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to courses_path
      flash[:success] = "Create course successfully!"
    else
      flash[:danger] = "Create course fail"
      render :new
    end
  end

  def new
    @course = Course.new
  end

  def destroy
    @course = Course.find_by id: params[:id]
    if @course.present?
      @course.destroy
      flash[:success] = "Delete course successfully"
    else
      flash[:danger] = "Course not found"
    end
  end

  def update
    @course = Course.find_by id: params[:id]
    if @course.update(course_params)
      flash[:success] = "Update successfully"
      redirect_to @course
    else
      render :edit
    end
  end

  def edit; end
  private
    def is_admin
      return if current_user.admin

      flash[:danger] = "You are not authorized to create course."
      redirect_to courses_path
    end

    def load_course
      @course = Course.find_by id: params[:id]
      return if @course

      flash.now[:danger] = "Not found course!"
      redirect_to root_path
    end

    def course_params
      params.require(:course).permit(:name, :description)
    end
end
