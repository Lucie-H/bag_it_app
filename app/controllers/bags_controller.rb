class BagsController < ApplicationController
	before_action :logged_in_user

	def new
		@bag = Bag.new
	end 

	def show
		@bag = Bag.find(params[:id])
	end

	def create
		@bag = current_user.bags.build(bag_params)
		if @bag.save
			flash[:success] = "Bag created!"
			redirect_to @bag
		else
			render 'new'
		end
	end

	def destroy
   	Bag.find(params[:id]).destroy
	  flash[:success] = "Bag deleted!"
	  redirect_to root_url
	end


	private 

		def bag_params
			params.require(:bag).permit(:name)
		end
end
