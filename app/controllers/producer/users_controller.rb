class Producer::UsersController < ApplicationController

  def show
    @user = User.find(params[:format])
    @orders = Order.where(designer_id: @user.id, producer_id: current_user.id)
    @designs = Design.where(user: @user, status: 'active')
  end

end