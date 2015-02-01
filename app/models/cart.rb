class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy




	def total_price_pln
		line_items.to_a.sum { |item| item.total_price_pln }
	end

	def total_price_eur
		line_items.to_a.sum { |item| item.total_price_eur }
	end
	
	def total_price_gbp
		line_items.to_a.sum { |item| item.total_price_gbp }
	end


	def add_product(product_id, quantity, size, color)
		current_item = line_items.find_by(product_id: product_id)
		n = quantity.to_i
		if current_item 
			current_item.quantity += n
		else
			current_item = line_items.build(product_id: product_id, quantity: n, size: size, color: color)
		end
		current_item
	end

	def remove_one(product_id)
		current_item = line_items.find_by(product_id: product_id)
		current_item.quantity -= 1
		return current_item
	end

	def remove_product(item)
		if item.quantity > 1
			item.quantity -= 1
			item.save
		else
			item.destroy
		end
	end

end
