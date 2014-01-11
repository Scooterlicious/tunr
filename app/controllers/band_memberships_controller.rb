#     band_memberships GET    /band_memberships(.:format)          band_memberships#index
#                      POST   /band_memberships(.:format)          band_memberships#create
#  new_band_membership GET    /band_memberships/new(.:format)      band_memberships#new
# edit_band_membership GET    /band_memberships/:id/edit(.:format) band_memberships#edit
#      band_membership GET    /band_memberships/:id(.:format)      band_memberships#show
#                      PUT    /band_memberships/:id(.:format)      band_memberships#update
#                      DELETE /band_memberships/:id(.:format)      band_memberships#destroy

class BandMembershipsController < ApplicationController
	
	def index
		@band_memberships = BandMembership.all
	end

	def new
		@musicians = Musician.all
		@bands = Band.all
	end

	def create
		@band_membership = BandMembership.new()
		@band_membership.musician_id 	= params[:musician_id]
		@band_membership.band_id 		= params[:band_id]
		@band_membership.save

	    redirect_to band_memberships_path

	 	# musician = Musician.find(params[:musician_id])
	 	# band = Band.find(params[:band_id])
	 	# musician.join(band, params[:instrument])
	 	# redirect_to band_path(band)
	end

end
