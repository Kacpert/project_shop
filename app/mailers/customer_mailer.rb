class CustomerMailer < ActionMailer::Base
  default from: "noreply@best.shop"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.account_activation.subject
  #
  def account_activation(customer)
    @greeting = "Hi"
    @customer = customer
    mail to: customer.email, subject: "Account Activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.password_reset.subject
  #
  def password_reset(customer)
    @customer = customer
    mail to: customer.email, subject: "Password reset"
  end
end
