class ProductsController < ApplicationController
	before_action :set_customer


	def show
    	@product = Product.find(params[:id])
    	@size = @product.options.split("\n")
    	@color = @product.color.split("\n")
 	end

	def shirts
		@products = category(0)
		@customer_favorites = favorites_id if logged_in?
	end

	def suits
		@products = category(1)
		@customer_favorites = favorites_id if logged_in?
	end

	def accessories
		@products = category(2)
		@customer_favorites = favorites_id if logged_in?
	end

	
	private

	def category(id)
		Product.where(category_id: id).paginate(:page => params[:page]).order('id DESC')
	end

	def favorites_id
		favorite_id = []
		current_user.favorites.each do |fav|
			favorite_id << fav.product_id
		end
		return favorite_id
	end

	def set_customer
		@customer = current_user
	end
end

