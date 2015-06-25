class ItemsController < ApplicationController
	before_action :logged_in_user
	respond_to :html, :js

	def new
		@item = Item.new
		@bag = Bag.find(params[:bag_id])
	end

	def create
		bag = Bag.find(params[:bag_id])
		@item = bag.items.build(item_params)
		if @item.save
			redirect_to bag
		else
			render 'new'
		end
	end

	def edit
		@item = Item.find(params[:id])
		@bag = Bag.find(params[:bag_id])
	end

	def update
		@item = Item.find(params[:id])
		@bag = Bag.find(params[:bag_id])		
		if @item.update_attributes(item_params)
      redirect_to @bag
    else
    	render 'edit'
    end
	end

	def destroy
		@bag = Bag.find(params[:bag_id])
		Item.find(params[:id]).destroy
	  redirect_to @bag
	end

	#def toggle
	#end

	private 

		def item_params
			params.require(:item).permit(:name, :quantity)
		end

end
