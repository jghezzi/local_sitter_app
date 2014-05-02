class UsersController < ApplicationController
  skip_filter :ensure_current_sitter
  
  def new
    @new_user = User.new
    @new_user.build_family
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      if @new_user.role == "FAMILY"
        redirect_to route_me_users_path
      else
        redirect_to route_me_users_path
      end
    else
      flash.now[:error] = "Something went wrong. Try again."
      render :new
    end
  end

  def user_params
    params.require(:user).permit!
  end

  def signup_family
    @new_user = User.new
    @new_user.build_family
  end

  def signup_sitter
    @new_user = User.new
    @new_user.build_sitter
  end

  def route_me
    if current_user.role == "FAMILY"
      redirect_to family_path(current_user.family.id)
    else
      redirect_to sitter_path(current_user.sitter.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :family_attributes => [:id, :name, :address], :sitter_attributes => [:name, :rate])
  end
end


