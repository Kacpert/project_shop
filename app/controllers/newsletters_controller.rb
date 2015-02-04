class NewslettersController < ApplicationController
  def create
  	email = Newsletter.new
  	email.email = params[:newsletter][:email] 
  	if email.save
  		redirect_to :back
  	else
  		redirect_to :back
  		flash[:dnager] = "Email is submited or is wrong"
  	end
  end
end
