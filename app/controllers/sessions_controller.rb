class SessionsController < ApplicationController

  def new
  end

  def create
    if user = Customer.find_by(email: (params[:session][:email]).downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_back_or user
      else
        redirect_to register_path
        flash[:danger] = t('flash.bad_password')
      end
    else
      flash[:danger] = t('flash.bad_email')
      redirect_to register_path
    end  	
  end


  def destroy
    log_out
    redirect_to root_url
  end

end
