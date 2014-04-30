class SittersController < ApplicationController
	def index
		@sitters = Sitter.all
	end
	def new
		@new_sitter = Sitter.new
	end
	def show
		@sitter = Sitter.find(params[:id])
	end
	def edit
		@sitter = Sitter.find(params[:id])
	end
	
	def create
		@new_sitter = Sitter.new(sitter_params)
		if @new_sitter.save
			redirect_to sitters_path
		else
			redirect_to new_sitter_path
		end
	end

	def update
		@sitter = Sitter.find(params[:id])
		@sitter.update_attributes(sitter_params)
		redirect_to sitters_path
	end
	private
	def sitter_params
		params.require(:sitter).permit!
	end
end
