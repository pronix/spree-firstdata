class Gateway::FirstData < Gateway
	preference :login, :string
	preference :pem, :text

  def provider_class
    ActiveMerchant::Billing::FirstDataGateway
  end
end
