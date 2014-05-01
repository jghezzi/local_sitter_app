class SittersController < ApplicationController

  def index
    @sitters = Sitter.all
  end

  def show
    @sitter = Sitter.find(params[:id])
  end

  def new
    @sitter = Sitter.new
  end

  def edit
    @sitter = Sitter.find(params[:id])
  end

  def create
    @sitter = Sitter.new(sitter_params)
    if @sitter.save
      redirect_to sitters_path
    else
      redirect_to sitter_path
    end
  end

  def update
    @sitter = Sitter.find(params[:id])
    if @sitter.update
      redirect_to sitter_path
    else
      redirect_to edit_sitter_path
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @sitter = Sitter.find(params[:id])
    if @sitter.destroy
      redirect_to sitters_path
    else
      redirect_to :back
    end
  end

  def search
    search_terms = params[:search]
    @to_dos = Sitter.search(search_terms)
    render search_sitters_path
  end

  private

  def sitter_params
    params.require(:sitter).permit(:name, :rate)
  end

end
