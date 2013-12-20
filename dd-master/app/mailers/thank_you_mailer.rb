class ThankYouMailer < ActionMailer::Base
  default from: 'cmh@cs.rit.edu'

  def thank_you_email (recipients)
    @email_address = recipients[:email_address]
    
    @card = AmazonGiftCard.where(:used => 0).first
  	@code = @card[:code]
  	@id = @card[:id]
  	
    mail(:to => @email_address, :subject => 'Thank you')
    
    # SET used to 1
  	AmazonGiftCard.update(@id, :used => 1)
  end
end
