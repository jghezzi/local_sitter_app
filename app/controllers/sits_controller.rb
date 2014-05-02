class SitsController < ApplicationController
	skip_filter :ensure_current_sitter
	
	def index
		@sits = Sit.all
	end

	def create
		@new_sit = Sit.new(sit_params)
		if @new_sit.save
			redirect_to sits_path
		else
			render new_sit_path
		end
	end

	def new
		@new_sit = Sit.new
	end

	def edit
		@sit = Sit.find(params[:id])
	end

	def update
		@sit = Sit.find(params[:id])
		if @sit.update_attributes(sit_params)
			redirect_to sits_path
		end
	end

	def show

	end

	def destroy
		@sit = Sit.find(params[:id])
		@sit.destroy
		redirect_to sits_path
	end

	#sitter edits sit request to accept
	def sitter_response
		@sit = Sit.find(params[:id])
	end

	#put / patch request to update table with sitter response
	def sitter_update
		@sit = Sit.find(params[:id])
		if @sit.update_attributes(sit_params)
			redirect_to sits_path
		end
	end

	private

	def sit_params
		params.require(:sit).permit!
	end

end