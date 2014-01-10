class AlbumsController < ApplicationController
	def new
		#Just displays the form..  No need to set up data
	end

	def index
		@albums = @Album.all
	end

	#create accepts the POST and so we need to store the data here
	def create
		@Albums.create({
			name: params[:name]
			})
	end
end