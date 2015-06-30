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

	def duplicate
		@bag = Bag.find(params[:id])		
		new_bag = @bag.dup
		new_bag.items = @bag.items
		if new_bag.save
			flash[:success] = "Bag duplicated!"
			redirect_to root_url
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end

	def weekend
		@bag = current_user.bags.build(name: "Weekend trip")
		weekend_items = { "socks" => 3, "pants" => 1, "shirts" => 2, "shoes" => 1, "sleeping bag" => 1, "umbrella" => 1 }
		weekend_items.each do |name, quantity|
			@item = @bag.items.build(name: name, quantity: quantity, bag_id: @bag.id)
		end 
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def beach
		@bag = current_user.bags.build(name: "Beach trip")
		beach_items = { "swimsuit" => 1, "towel" => 1, "flipflops" => 1, "sunblock" => 1, "book" => 1}
		beach_items.each do |name, quantity|
			@item = @bag.items.build(name: name, quantity: quantity, bag_id: @bag.id)
		end 
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def ski
		@bag = current_user.bags.build(name: "Ski trip")
		ski_items = { "ski" => 1, "ski suit" => 1, "sunglasses" => 1, "sunblock" => 1, "helmet" => 1}
		ski_items.each do |name, quantity|
			@item = @bag.items.build(name: name, quantity: quantity, bag_id: @bag.id)
		end 
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def conference
		@bag = current_user.bags.build(name: "Conference")
		conference_items = { "laptop" => 1, "laptop charger" => 1, "sticker" => 10, "USB stick" => 2, "Club Mate" => 4}
		conference_items.each do |name, quantity|
			@item = @bag.items.build(name: name, quantity: quantity, bag_id: @bag.id)
		end 
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end 

	def reset 
		@bag = Bag.find(params[:id])
		@bag.items.each do |item|
			item.update_attributes(status: false)	
		end
		if @bag.save
			redirect_to @bag
		else
			flash[:danger] = "something went wrong"
			redirect_to @bag
		end
	end 

	private 

		def bag_params
			params.require(:bag).permit(:name)
		end
end
