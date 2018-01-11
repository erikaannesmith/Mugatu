class Producer::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:format])
  end

  def ship
    @order = Order.find(params[:format])
    @order.shipped!
    @order.design.inactive!
    redirect_to producer_order_path(current_user, @order)
    flash[:success] = "Order ##{@order.id} has been marked as 'shipped'."
  end

end