class Producer::OrdersController < ApplicationController

  def index
    @orders = Order.where(producer_id: params[:format])
  end

  def show
    @order = Order.find(params[:format])
  end

  def ship
    @order = Order.find(params[:format])
    @order.shipped!
    redirect_to producer_order_path(current_user, @order)
    flash[:notice] = "Order ##{@order.id} has been marked as 'shipped'."
  end

end