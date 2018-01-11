class Designer::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:format])
  end

  def receive
    @order = Order.find(params[:format])
    @order.received!
    redirect_to new_designer_order_rating_path(current_user, @order)
    flash[:message] = "Order ##{@order.id} has been marked as 'received'."
  end

end