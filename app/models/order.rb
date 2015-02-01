class Order < ActiveRecord::Base



	def create_from_cart(cart, customer, shipping)
		cart.line_items.each do |item|

			product = item.product
			customer = customer
			o = Order.new
			
			o.customer_id = customer.id
			o.product_id = product.id
			o.product_amount = item.quantity
			o.product_option = item.size
			o.product_color = product.color
			o.product_price = product.price_pln
			o.shipping_price = product.price_pln
			o.shipping = shipping
			o.order_currency = 'pln'
			o.status = 'OCZEKUJE'
			o.shipping_zip_code = customer.zip_code 
			o.shipping_city = customer.city
			o.shipping_address = customer.address
			o.save
		end
	end
end
