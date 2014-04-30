class FamiliesController < ApplicationController
	def index
		@families = Family.all
	end
	def new
		@new_family = Family.new
	end
	def edit
		@family = Family.find(params[:id])
	end
	def create
		@new_family = Family.new(family_params)
		if @new_family.save
			redirect_to families_path
		else
			redirect_to new_families_path
		end
	end

	def update
		@family = Family.find(params[:id])
		if @family.update_attributes(family_params)
			redirect_to families_path
		else 
			redirect_to edit_families_path
		end
	end
	def destroy
		@family = Family.find(params[:id])
		@family.destroy
		redirect_to families_path
	end

	private
	def family_params
		params.require(:family).permit!
	end
end
