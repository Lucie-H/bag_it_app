class BagsController < ApplicationController
	before_action :logged_in_user

	def new
    if params[:template]
      @bag = Bag.new.standard_bags(Bag::TEMPLATES[params[:template].to_sym], current_user)
      if @bag.save
      	redirect_to @bag
      else
      	flash[:danger] = "something went wrong"
      	redirect_to root_url
      end
    else
      @bag = Bag.new
    end
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
		new_bag = @bag.duplicate
		if new_bag.save
			flash[:success] = "Bag duplicated!"
			redirect_to root_url
		else
			flash[:danger] = "something went wrong"
			redirect_to root_url
		end
	end

	def reset 
		@bag = Bag.find(params[:id])
		@bag.reset
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
