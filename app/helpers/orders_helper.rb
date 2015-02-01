module OrdersHelper

	def currency_def
		if !(session[:currency].blank?)

			if session[:currency] == "PLN"
				return "PLN"
			elsif session[:currency] == "EUR"
				return "EUR"
			else
				redirect_to root_url
			end

		else
			if params[:locale] == "en"
			 return "EUR" 
			else
			 return "PLN"
			end
		end
	end

end
