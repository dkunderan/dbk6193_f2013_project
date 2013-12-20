class ThanksController < ApplicationController

  layout "thanks"

  def index   
    ThankYouMailer.thank_you_email({:email_address => session[:email_address]}).deliver
  end
end
