class MusiciansController < ApplicationController
	def index
		@musicians = Musician.all
	end

	def new
	end

	def edit
		@musician = Musician.find(params[:id])
		@musician.name = params[:name]
		@musician.save
		#musician GET    /musicians/:id(.:format)             musicians#show

		redirect_to musician_path(params[:id])

	end

	def create
		Musician.create({
			name: params[:name]
		})
		redirect_to musicians_path
	end
end 