class Designer::OrdersController < ApplicationController

  def index
    user = User.find(params[:format])
    @orders = Order.where(designer_id: user.id)
  end

  def show
    @order = Order.find(params[:format])
  end

  def receive
    @order = Order.find(params[:format])
    @order.received!
    redirect_to designer_order_path(current_user, @order)
    flash[:message] = "Order ##{@order.id} has been marked as 'received'."
  end

end