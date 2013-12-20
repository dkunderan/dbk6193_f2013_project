class Order < ActiveRecord::Base
   	has_many :line_items, :dependent => :destroy
   	#PAYMENT_TYPES = ["Check","Credit card","Purchase order"]
   	# playtime - translate payment types
	if I18n.locale.to_s == 'en'
		PAYMENT_TYPES = ["Cheque", "Credit card", "Purchase order"]
	else if I18n.locale.to_s == 'es'
    	PAYMENT_TYPES = ["Cheque", "Tarjeta de credito", "Orden de compra"]
    end
   	end
  
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
   
   def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
