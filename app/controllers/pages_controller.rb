class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def profile
    if (!user_signed_in?)
      redirect_to new_user_session_path
    end
    @user = current_user
  end

end
