#     musicians GET    /musicians(.:format)                 musicians#index
#               POST   /musicians(.:format)                 musicians#create
#  new_musician GET    /musicians/new(.:format)             musicians#new
# edit_musician GET    /musicians/:id/edit(.:format)        musicians#edit
#      musician GET    /musicians/:id(.:format)             musicians#show
#               PUT    /musicians/:id(.:format)             musicians#update
#               DELETE /musicians/:id(.:format)             musicians#destroy



class MusiciansController < ApplicationController
	def index
		@musicians = Musician.all
	end

	def new
		@musician = Musician.new()
	end

	def show
		@musician = Musician.find(params[:id])
	end	

	def destroy 
		Musician.find(params[:id]).destroy
		redirect_to musicians_path
	end	

	def edit
		@musician = Musician.find(params[:id])
	end

	def update
		@musician = Musician.find(params[:id])
		@musician.name = params[:musician][:name]
		@musician.save
		redirect_to musician_path(params[:id])
	end

	def create
		Musician.create({
			name: params[:musician][:name]
		})
		redirect_to musicians_path
	end
end 