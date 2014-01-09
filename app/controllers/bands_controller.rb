class BandsController < ApplicationController
	def index
		@bands = Band.all
	end

	def new
	end

	def create
		Band.create({
			name: params[:name]
		})
		redirect_to bands_path
	end
end