class NotifierMailer < ApplicationMailer

  default :from => "Huê Nguyễn <huenguyen001suzushi@gmail.com>"
 
    def order_received(order)    
        @order = order
  
        mail :to => @order.email, :subject => "We've received your order"
    end
end
