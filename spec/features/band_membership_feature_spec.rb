require 'spec_helper'

describe BandMembershipsController do

	describe "creating a band membership" do
		describe "starting on the new memberships page" do
			before do
				@jack = Musician.create name: 'Jack White'
				@white_stripes = Band.create name: 'The White Stripes'
				visit band_memberships_path
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


