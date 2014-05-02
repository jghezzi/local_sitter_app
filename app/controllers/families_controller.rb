class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to families_path
    else
      redirect_to family_path
    end
  end

  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(family_params)
      redirect_to :action => 'show', :id => @family
    else
      @families = Family.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    Family.find(params[:id]).destroy
    redirect_to families_path
  end


  private

  def family_params
    params.require(:family).permit(:name, :kids_attributes => [ :id, :name, :age, :gender, :comments, :_destroy ])
  end

end
