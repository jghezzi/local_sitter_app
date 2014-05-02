class SessionsController < ApplicationController
  skip_filter :ensure_current_sitter, :ensure_logged_in

  def new

  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to route_me_users_path, success: "logged in"
    else
      flash.now.alert = "invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, success: "You logged out!"
  end

  def family_new

  end
end