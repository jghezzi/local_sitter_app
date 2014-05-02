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
      redirect_to family_path(@family)
    else
      render edit_family_path
    end
  end

  def destroy
    @family = Family.find(params[:id])
    if @family.destroy
      redirect_to families_path
    else
      redirect_to family_path(@family)
    end
  end

  private

  def family_params
    params.require(:family).permit(:name, :kids_attributes => [ :id, :name, :age, :gender, :comments, :_destroy ])
  end

end
