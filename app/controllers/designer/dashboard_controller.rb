class Designer::DashboardController < ApplicationController

  def show
    @designs = current_user.designs
    @orders = Order.where(designer_id: current_user.id)
  end

end