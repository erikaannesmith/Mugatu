class Producer::ShippingController < ApplicationController

  def show
    order = Order.find(params[:format])
    label_url = ShippingLabel.generate_label(order)
    redirect_to label_url
  end

end