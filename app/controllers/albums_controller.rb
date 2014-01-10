class AlbumsController < ApplicationController
	def new
		#Just displays the form..  No need to set up data
	end

	def index
		@albums = Album.all
	end

	#create accepts the POST and so we need to store the data here
	def create
		Album.create({
			name: params[:name]
			})
		redirect_to albums_path
	end
end