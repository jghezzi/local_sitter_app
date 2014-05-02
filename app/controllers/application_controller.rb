class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_logged_in, :ensure_current_sitter
  helper_method :current_user

  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in
    if current_user.nil?
      redirect_to login_path, notice: "You are not logged in"
    end
  end

  def ensure_current_sitter
    unless current_user.sitter.id != params[:id].to_i
      redirect_to login_path, notice: "You are not authorized to visit this page"
    end
  end

  def ensure_current_family
    if current_user.nil?
      redirect_to login_path, notice: "You are not authorized to visit this page"
    end
  end

end
