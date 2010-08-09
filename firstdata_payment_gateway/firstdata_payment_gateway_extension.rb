class FirstdataPaymentGatewayExtension < Spree::Extension
  version "1.0"
  description "Provides basic FirstData payment gateway functionality"

  def activate  
    require 'active_merchant'

    # Mixin the payment_gateway method into the base controller so it can be accessed by the checkout process, etc.
    Creditcard.class_eval do
      # add gateway methods to the creditcard so we can authorize, capture, etc.
      include Spree::PaymentGateway
    end          
    
    require 'active_merchant/billing/first_data' 
    
    #register payment method
    [
      Gateway::FirstData
    ].each{|gw|
      begin
        gw.register  
      rescue Exception => e
        $stderr.puts "Error registering FirstData gateway #{gw}: #{e}"
      end
    }
  end
end
