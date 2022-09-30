class EnrollsController < ApplicationController
  def create
    @course = Course.find params[:course_id]
    if @course.present?
      if current_user.admin
        flash[:warning] = "Admin can't not enroll a course"
        redirect_to root_path
      else
        current_user.enroll @course
        respond_to do |format|
          format.html { redirect_to @course }
          format.js
      end
    else
      flash[:warning] = "Course not found"
      redirect_to root_path
    end
  end
end
