class Gateway::FirstData < Gateway
	# Логин он-же Store Number
	preference :login, :string
	# Ключ сервиса 
	preference :pem, :text

  def provider_class
    ActiveMerchant::Billing::FirstDataGateway
  end
end
