class ProductsController < ApplicationController


	def show
    	@product = Product.find(params[:id])
    	@size = @product.options.split("\n")
    	@color = @product.color.split("\n")
 	end

	def shirts
		@products = category(0)
	end

	def suits
		@products = category(1)
	end

	def accessories
		@products = category(2)
	end

	
	private

	def category(id)
		Product.where(category_id: id).paginate(:page => params[:page]).order('id DESC')
	end
end

