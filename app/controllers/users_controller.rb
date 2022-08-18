class UsersController < ApplicationController
  def index
    if (user_signed_in?)
      @pagy, @users = pagy(User.all, items: 10)
    else
      flash[:danger] = "Please login first!!"
      redirect_to root_path
    end
  end

  def show
    if (user_signed_in?)
      @user = User.find_by id: params[:id]
      return @user if @user

      flash[:danger] = "User not found"
      redirect_to root_path
    else
      flash[:danger] = "Please login first!!"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    if (@user.present?)
      @user.destroy
      flash[:success] = "Delete user successfully"
    else
      flash[:danger] = "User not found"
    end

    respond_to do |format|
      format.html { redirect_to users_path }
      format.js
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash.now[:success] = "Profile updated successfully!"
      redirect_to @user
    else
      render :edit
    end
  end

  def courses
    @title = "Enrolled courses"
    @courses = current_user.courses.all
    render :courses
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email,
                                        :password, :password_confirmation)
  end

  def correct_user
    redirect_to root_url unless (@user && @user == current_user)
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash.now[:danger] = "Not found user!"
    redirect_to root_path
  end
end
