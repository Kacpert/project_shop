class PasswordResetsController < ApplicationController
  before_action :get_customer,         only: [:edit, :update]
  before_action :valid_customer,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @customer = Customer.find_by(email: params[:password_reset][:email].downcase)
    if @customer
      @customer.create_reset_digest
      @customer.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to register_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if both_passwords_blank?
      flash.now[:danger] = "Password/confirmation can't be blank"
      render 'edit'
    elsif @customer.update_attributes(customer_params)
      log_in @customer
      flash[:success] = "Password has been reset."
      redirect_to @customer
    else
      render 'edit'
    end
  end


  
  private

    def customer_params
      params.require(:customer).permit(:password, :password_confirmation)
    end

    # Returns true if password & confirmation are blank.
    def both_passwords_blank?
      params[:customer][:password].blank? &&
      params[:customer][:password_confirmation].blank?
    end

    # Before filters

    def get_customer
      @customer = Customer.find_by(email: params[:email])
    end

    # Confirms a valid customer.
    def valid_customer
      unless (@customer && @customer.activated? &&
              @customer.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @customer.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
