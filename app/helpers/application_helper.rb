module ApplicationHelper
  def hidden_div_if(condition,attributes ={}, &block)
    if condition
      attributes["style"] = "display:none"
    end 
    content_tag("div",attributes, &block)
  end
  
  def currency_to_locale(price)
    price = price / 1.36 if 'es' == I18n.locale.to_s
    number_to_currency(price)
  end
end