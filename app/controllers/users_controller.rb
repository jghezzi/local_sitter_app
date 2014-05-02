class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to login_path, notice: "You signed up!"
    else
      flash.now[:error] = "Something went wrong. Try again."
      render :new
    end
  end

  def user_params
    params.require(:user).permit!
  end
end
