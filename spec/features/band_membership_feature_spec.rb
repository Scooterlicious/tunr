require 'spec_helper'

#     band_memberships GET    /band_memberships(.:format)          band_memberships#index
#                      POST   /band_memberships(.:format)          band_memberships#create
#  new_band_membership GET    /band_memberships/new(.:format)      band_memberships#new
# edit_band_membership GET    /band_memberships/:id/edit(.:format) band_memberships#edit
#      band_membership GET    /band_memberships/:id(.:format)      band_memberships#show
#                      PUT    /band_memberships/:id(.:format)      band_memberships#update
#                      DELETE /band_memberships/:id(.:format)      band_memberships#destroy


describe BandMembershipsController do

	describe "creating a band membership" do
		describe "starting on the new memberships page" do
			before do
				@jack = Musician.create name: 'Jack White'
				@white_stripes = Band.create name: 'The White Stripes'
				visit new_band_membership_path
			end
			it "can create a band membership" do

				select @jack.name, {:from => 'musician_id'}
				select @white_stripes.name, {:from => 'band_id'}

				click_button 'submit'

				@jack.bands.should include @white_stripes

			end
		end
	end
end


