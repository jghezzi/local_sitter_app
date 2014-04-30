class SitsController < ApplicationController
	def index
		@sits = Sit.all
	end
	def new
		@new_sit = Sit.new
	end
	def create
		@new_sit = Sit.new(sit_params)
		if @new_sit.save
			redirect_to sits_path
		else
			redirect_to new_sit_path
		end
	end
	def show
		@sit = Sit.find(params[:id])
	end
	def edit
		@sit = Sit.find(params[:id])
	end
	def update
		@sit = Sit.find(params[:id])
		@sit.update_attributes(sit_params)
		redirect_to sits_path
	end
	def destroy
		@sit = Sit.find(params[:id])
		@sit.destroy
		redirect_to sits_path
	end

	private

	def sit_params
		params.require(:sit).permit!
	end
end
