require 'easypost'

class ShippingLabel
  def self.generate_label(order)
    EasyPost.api_key = "mXq06UkVJZAa4lHWjVuwxw"
    producer = order.application.user
    designer = order.design.user

    fromAddress = EasyPost::Address.create(
      company: producer.name,
      street1: producer.address,
      street2: '',
      city: producer.city,
      state: producer.state,
      zip: producer.postal_code,
      phone: producer.phone_number
    )
    toAddress = EasyPost::Address.create(
      name: designer.name,
      company: '',
      street1: designer.address,
      city: designer.city,
      state: designer.state,
      zip: designer.postal_code
    )
    parcel = EasyPost::Parcel.create(
      predefined_package: 'FlatRateEnvelope',
      weight: 10
    )
    shipment = EasyPost::Shipment.create(
      to_address: toAddress,
      from_address: fromAddress,
      parcel: parcel
    )
    shipment.buy(
      :rate => shipment.lowest_rate
    )

    shipment.insure(amount: 100)

    shipment.postage_label.label_url
  end

end