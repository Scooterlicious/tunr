require 'spec_helper'

describe BandMembership do
  describe "given a musician and a band" do

  	before do
  		@musician = Musician.create name: "Dave Grohl"
  		@band = Band.create name: "Nirvana"
  	end

  	describe "when a musician joins a band" do
  		before do
  			@musician.bands.push(@band)
  		end
  		# it "contains instrument" do
  		# 	requirements = {
  		# 		band_id: @band.id,
  		# 		musician_id: @musician.id,
  		# 	}
  		# 	BandMembership.where(requirements).first.should include @band.id
  		# end
  		it "should include musician in band.musicians" do
  			@band.musicians.should include @musician
  		end
  		it "should band in musician.bands" do
  			@musician.bands.should include @band
  		end
  	end
  end

  

end
