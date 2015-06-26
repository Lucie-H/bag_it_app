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

	def edit
		@bag = Bag.find(params[:id])
	end

	def update
		@bag = Bag.find(params[:id])		
		if @bag.update_attributes(bag_params)
      if URI(request.referer).path == edit_bag_path(@bag)
      	redirect_to @bag 
      else 
      	redirect_to root_url
      end
    else
    	render 'edit'
    end
	end

	def destroy
   	Bag.find(params[:id]).destroy
	  flash[:success] = "Bag deleted!"
	  redirect_to root_url
	end

	def weekend
		@bag = current_user.bags.build(name: "Weekend trip")
		@item = @bag.items.build(name: "socks", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "pants", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "shirt", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "shoes", quantity: "1", bag_id: @bag.id)
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	private 

		def bag_params
			params.require(:bag).permit(:name)
		end
end
