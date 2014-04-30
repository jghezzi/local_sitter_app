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

  def family_params
    params.require(:family).permit(:name)
  end

end
