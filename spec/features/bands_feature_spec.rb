require 'spec_helper'

describe BandsController do
	describe "Given a band name" do
		before do
			@name = "Guns and Roses"
		end

		describe "Go to new_band_path" do
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


	describe "Given a Band" do
		before do
			@band = Band.create(name: "Dummy")
		end
		describe "when we visit the edit page" do
			before do
				visit edit_band_path(@band)
			end 
			it "should have the bands name" do
				find_field("band_name").value.should == @band.name
			end
			describe "when we edit the band_name" do
				before do
					fill_in "band_name", with: "Diana"
					click_button "submit"
				end
				it "should take us to the show page" do
					current_path.should == band_path(@band)
				end
				it "should have the new name" do
					page.should have_content("Diana")
				end
			end
		end
	
		describe "when we visit the index page" do
			before do
				visit bands_path
			end
			describe "when we click the delete button" do
				before do
					within "tr.band_#{@band.id}" do
						click_button "DELETE"
					end
				end
				it "should leave us on the index page" do
					#This is bizarre: IT should be just fine...  When I do this interactively, it lands me back on the /bands page, and the bands_path should be exactly that.
					#current_path.should == bands_path
					current_path.should == '/bands'
				end
				it "should no longer have the band" do
					page.should_not have_content(@band.name)
				end
			end
		end
	end






end