class ItemsController < ApplicationController
	before_action :logged_in_user

	def new
		@bag = Bag.find(params[:bag_id])
		@item = Item.new
	end

	def create
		bag = Bag.find(params[:bag_id])
		@item = bag.items.build(item_params)
		if @item.save
			redirect_to bag
		else
			bag = Bag.find(params[:bag_id])
			render 'items/new'
		end
	end

	def destroy
		bag = Bag.find(params[:bag_id])
		Item.find(params[:id]).destroy
	  redirect_to bag
	end

	private 

		def item_params
			params.require(:item).permit(:name, :quantity)
		end

end
