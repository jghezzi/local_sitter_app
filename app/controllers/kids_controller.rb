class KidsController < ApplicationController
  skip_filter :ensure_current_sitter

  #GET '/kids'
  def index
    @kids = Kid.all
  end

  #GET '/kids/new'
  def new
    @kid = Kid.new
  end

  #GET '/kids/:id/edit'
  def edit
    @kid = Kid.find(params[:id])
  end

  def create
    @new_kid = Kid.new(kid_params)
    if @new_kid.save
      redirect_to kids_path
    else
      redirect_to new_kid_path
    end
  end

  def show
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    if @kid.update_attributes(kid_params)
      redirect_to :action => 'show', :id => @kid
    else
      @kids = Kid.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    Kid.find(params[:id]).destroy
    redirect_to kids_path
  end



  # PATCH "/kids/:id/change_kid"
  def change_kid
    @kid = Kid.find(params[:id])
    @kid.update_attributes
    redirect_to kids_path
  end

  private

  def kid_params
    params.require(:kid).permit!
  end
end
