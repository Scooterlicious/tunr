require 'spec_helper'

describe MusiciansController do
	describe "Given a musician name" do
		before do
			@name = "Diana Ross"
		end

		describe "goto new musician form" do
			before do
	  		visit new_musician_path
	  		end

		  	it "Create musician from a form" do
				fill_in 'name', with: @name
				click_button "submit"
				current_path.should == musicians_path
				page.should have_content(@name)
			end
	  end
	end
end