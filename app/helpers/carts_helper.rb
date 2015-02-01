module CartsHelper


	def total_price
		if !(session[:currency].blank?)

			if session[:currency] == "PLN"
				@cart.total_price_pln.to_s + " zł"
			elsif session[:currency] == "EUR"
				@cart.total_price_eur.to_s + " €"
			else
				redirect_to root_url
				flash[:notice] = "You prowide wrong currency if you don`t write it by hand pls community with support"
			end

		else
			params[:locale] == "en" ? @cart.total_price_eur.to_s + " €" : @cart.total_price_pln.to_s + " zł" 
		end
	end
end
