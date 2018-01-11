class Designer::UsersController < ApplicationController

  def show
    @user = User.find(params["format"])
    @orders = Order.where(designer_id: current_user.id, producer_id: @user.id)
  end

end