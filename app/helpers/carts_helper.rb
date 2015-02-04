module CartsHelper


	def total_price
		if !(session[:currency].blank?)

			if session[:currency] == "PLN"
				@cart.total_price_pln.to_s + " zł"
			elsif session[:currency] == "EUR"
				@cart.total_price_eur.to_s + " €"
			elsif session[:currency] == "GBP"
				@cart.total_price_gbp.to_s + " £"
			else
				@cart.total_price_pln.to_s + " zł"
			end

		else
			params[:locale] == "en" ? @cart.total_price_eur.to_s + " €" : @cart.total_price_pln.to_s + " zł" 
		end
	end
end
