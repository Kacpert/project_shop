class ProductsController < ApplicationController


	def shirts
		@shirts = Product.where(category_id: 1)
	end

	def suits
		@suits = Product.where(category_id: 2)
	end

	def akcessories
		@akcessories = Product.where(category_id: 3)
	end
end

