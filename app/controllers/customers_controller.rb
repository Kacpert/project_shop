class CustomersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]


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
      log_in @customer
    	flash[:success] = "Welcome to the Sample App!"
   		redirect_to @customer

    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
      redirect_to @customer

    else
      render 'edit'
    end
  end




 private
 
    def customer_params
      params.require(:customer).permit(:name, :email, :password, :last_name, :phone, :city, :zip_code, :address,
                                   :password_confirmation)
    end


    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to register_path
      end
    end


    # Confirms the correct user.
    def correct_user
      @user = Customer.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

end
