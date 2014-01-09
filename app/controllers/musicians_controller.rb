class MusiciansController < ApplicationController
	def index
		@musicians = Musician.all
	end

	def new
	end

	def create
		Musician.create({
			name: params[:name]
		})
		redirect_to musicians_path
	end
end 