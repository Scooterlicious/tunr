require 'spec_helper'

describe BandsController do
	describe "Giving a band name" do
		before do
			@name = "Gans and Roses"
		end

		describe "Goto Band form" do
			before do
				visit new_band_path
			end

			it "Create band from a form" do
				fill_in 'name', with: @name
				click_button "submit"
				current_path.should == bands_path
				page.should have_content(@name)
			end
		end
	end
end