class ProductsController < ApplicationController


	def show
    	@product = Product.find(params[:id])
 	end



	def shirts
		@shirts = category(0)
	end

	def suits
		@suits = category(1)
	end

	def accessories
		@accessories = category(2)
	end

	
	private
	def category(id)
		Product.where(category_id: id).paginate(:page => params[:page]).order('id DESC')
	end
end

