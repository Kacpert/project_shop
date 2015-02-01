class OrdersController < ApplicationController
	include OrdersHelper
	before_action :logged_in?

	def new
		@customer = current_user
		@order = Order.new(shipping_city: @customer.city,
		 shipping_zip_code: @customer.zip_code, shipping_address: @customer.address)
		
	end

	def create
		currency = currency_def
		save_order(order_params, @cart, current_user, currency)
    redirect_to register_path
	end

private
 
    def order_params
      params.require(:order).permit(:shipping, :order_currency, :shipping_city, :shipping_zip_code, :shipping_address)
    end

    def save_order(order_params, cart, customer, currency)
    	
    	customer = customer
    	size = ""
    	products_id = ""
    	amount = ""
    	color = ""
    	products_price = ""
			cart.line_items.each do |item|
			product = item.product

			if currency == "EUR" 
			 price = product.price_eur
			elsif currency == "PLN" 
			 price = product.price_pln
			else
				price = product.price_gbp
			end

					
			size += "#{item.size}/"
			products_id += "#{product.id}/"
			amount += "#{item.quantity}/"
			color += "#{product.color}/"
			products_price += "#{price}/"		
			end

			if currency == "EUR" 
				total_price = cart.total_price_eur
			elsif currency == "PLN" 
				total_price = cart.total_price_pln
			else
				total_price = cart.total_price_gbp
			end
			order = Order.new(order_params)			
			order.product_option = size
			order.customer_id = customer.id
			order.product_id = products_id
			order.product_amount = amount
			order.product_color = color
			order.product_price = products_price
			order.shipping_price = total_price
			order.order_currency = currency
			order.status = 'OCZEKUJE'			
			order.save



		end

end
