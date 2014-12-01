class ProductsController < ApplicationController


	def shirts
		@shirts = Product.where(category_id: 1)
	end

	def suits
		@suits = Product.where(category_id: 2)
		@pictures = @suits.photos.split("/")
	end

	def accessories
		@accessories = Product.where(category_id: 3)
		@pictures = @sacccessories.photos.split("/")
	end
end

