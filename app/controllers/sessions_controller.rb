class SessionsController < ApplicationController

  def new
  end

  def create
    if user = Customer.find_by(email: (params[:session][:email]).downcase)
      if user && user.authenticate(params[:session][:password])
        session_create(user)
        redirect_to_last_request_or(user)
      else
        redirect_to register_path
        flash[:danger] = t('flash.bad_password')
      end
    else
      flash[:danger] = t('flash.bad_email')
      redirect_to register_path
    end  	
  end

end
