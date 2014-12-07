class ProductsController < ApplicationController


	def show
    	@product = Product.find(params[:id])
 	end

 	def favourite
		@products = current_user.favorite_products
	end

	def shopcart
		@products = current_user.shopcart_products		
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

