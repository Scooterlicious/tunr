#     bands GET    /bands(.:format)                     bands#index
#           POST   /bands(.:format)                     bands#create
#  new_band GET    /bands/new(.:format)                 bands#new
# edit_band GET    /bands/:id/edit(.:format)            bands#edit
#      band GET    /bands/:id(.:format)                 bands#show
#           PUT    /bands/:id(.:format)                 bands#update
#           DELETE /bands/:id(.:format)                 bands#destroy


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


	def show
		@band = Band.find(params[:id])
	end	

	def destroy 
		Band.find(params[:id]).destroy
		redirect_to bands_path
	end	

	def edit
		@band = Band.find(params[:id])
	end

	def update
		@band = Band.find(params[:id])
		@band.name = params[:band][:name]
		@band.save
		redirect_to band_path(params[:id])
	end

	
end