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
		@item = @bag.items.build(name: "socks", quantity: "2", bag_id: @bag.id)
		@item = @bag.items.build(name: "pants", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "shirts", quantity: "2", bag_id: @bag.id)
		@item = @bag.items.build(name: "shoes", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "sleeping bag", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "umbrella", quantity: "1", bag_id: @bag.id)
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def beach
		@bag = current_user.bags.build(name: "Beach trip")
		@item = @bag.items.build(name: "swimsuit", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "towel", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "flipflops", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "sunblock", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "book", quantity: "1", bag_id: @bag.id)
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def ski
		@bag = current_user.bags.build(name: "Ski trip")
		@item = @bag.items.build(name: "ski", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "ski suit", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "sunglasses", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "sunblock", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "helmet", quantity: "1", bag_id: @bag.id)
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def conference
		@bag = current_user.bags.build(name: "Conference")
		@item = @bag.items.build(name: "laptop", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "laptop charger", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "sticker", quantity: "10", bag_id: @bag.id)
		@item = @bag.items.build(name: "USB stick", quantity: "1", bag_id: @bag.id)
		@item = @bag.items.build(name: "Club Mate", quantity: "1", bag_id: @bag.id)
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
