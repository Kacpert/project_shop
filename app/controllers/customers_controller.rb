class CustomersController < ApplicationController

  def index
    render 'new'
  end
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

    def create
    @customer = Customer.new(customer_params)
    if @customer.save
    	flash[:success] = "Welcome to the Sample App!"
   		redirect_to @customer
    else
      render 'new'
    end
  end



 private

    def customer_params
      params.require(:customer).permit(:name, :email, :password, :last_name, :phone, :city, :zip_code, :address,
                                   :password_confirmation)
    end
end