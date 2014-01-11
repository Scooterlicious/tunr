require 'spec_helper'

describe MusiciansController do
	describe "Given a Musician" do
		before do
			@musician = Musician.create(name: "Dummy")
		end
		describe "when we visit the edit page" do
			before do
				visit edit_musician_path(@musician)
			end 
			it "should have the musicians name" do
				find_field("musician_name").value.should == @musician.name
			end
			describe "when we edit the musician_name" do
				before do
					fill_in "musician_name", with: "Diana"
					click_button "submit"
				end
				it "should take us to the show page" do
					current_path.should == musician_path(@musician)
				end
				it "should have the new name" do
					page.should have_content("Diana")
				end
			end
		end
	
		describe "when we visit the index page" do
			before do
				visit musicians_path
			end
			describe "when we click the delete button" do
				before do
					within "tr.musician_#{@musician.id}" do
						click_button "DELETE"
					end
				end
				it "should leave us on the index page" do
					#This is bizarre: IT should be just fine...  When I do this interactively, it lands me back on the /musicians page, and the musicians_path should be exactly that.
					#current_path.should == musicians_path
					current_path.should == '/musicians'
				end
				it "should no longer have the musician" do
					page.should_not have_content(@musician.name)
				end
			end
		end
	end
end


# require 'spec_helper'

# describe MusiciansController do
# 	describe "Given a musician name" do
# 		before do
# 			@name = "Diana Ross"
# 		end

# 		describe "goto new musician form" do
# 			before do
# 	  		visit new_musician_path
# 	  		end

# 		  	it "Create musician from a form" do
# 				fill_in 'name', with: @name
# 				click_button "submit"
# 				current_path.should == musicians_path
# 				page.should have_content(@name)
# 			end
# 	  end
# 	end
# end