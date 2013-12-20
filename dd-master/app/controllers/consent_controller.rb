class ConsentController < ApplicationController

  def info_letter

    if request.post?
      if @student =  params[:student] and  @student[:student_type] == "RIT"
      else
         redirect_to :action => 'not_eligible'
      end
    else 
      redirect_to :action => 'index'
    end
  end

  def index
    @student = Student.new
#    @recruitee_coupon = session[:recruitee_coupon]
  end

  def not_eligible
  end

end
