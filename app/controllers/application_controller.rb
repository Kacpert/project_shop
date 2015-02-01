class ApplicationController < ActionController::Base
  include CurrentCart
  include SessionsHelper
  
  before_action :set_cart
	before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  




  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { locale: I18n.locale }
  end

  
end
