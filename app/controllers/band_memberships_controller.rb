class BandMembershipsController < ApplicationController
	def new
		@musicians = Musician.all
		@bands = Band.all
	end

	def create
	 	musician = Musician.find(params[:musician_id])
	 	band = Band.find(params[:band_id])
	 	musician.join(band, params[:instrument])
	 	redirect_to band_path(band)
	end

end
