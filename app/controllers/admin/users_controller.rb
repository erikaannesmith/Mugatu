class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:format])
    @designer_orders = Order.where(designer_id: @user.id)
    @producer_orders = Order.where(producer_id: @user.id)   
  end

end