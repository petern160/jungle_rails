class WelcomeMailer < ApplicationMailer
    def welcome_send(order)  
             
        @total = order.total
        @order = order
        @id = order.id
        @line_items = order.line_items
        @url = 'http://example.com/login'
        mail(to: order.email, subject: "hey this is the receipt" )
    end

end
