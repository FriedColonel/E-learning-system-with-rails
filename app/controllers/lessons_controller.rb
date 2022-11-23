class LessonsController < ApplicationController
  def create
    @course = Course.find_by id: params[:course_id]
    @lesson = Lesson.new({
      name: params[:lesson][:name],
      course_id: @course.id
    })
    @course.lessons << @lesson
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @course = Course.find_by id: params[:course_id]
    @lesson = Lesson.find_by id: params[:id]
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to @course }
      format.js
    end
  end
end
