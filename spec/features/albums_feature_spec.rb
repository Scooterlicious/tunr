require 'spec_helper'

describe AlbumsController do
	describe "Given an album name" do
		@album = Album.create({
			name: "Carried Away"
		})
	end
	describe "Go to new album form" do
	
		before do
			visit new_album_path
		end
		it "Creates an album from a form" do
			fill_in 'name', with: @name
			click_button "submit"
			current_path.should == musicians_path
			page.should have_content(@name)

		end
	end
end
