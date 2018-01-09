class Designer::DashboardController < ApplicationController

  def show
    byebug
    
    @designs = current_user.designs
    @orders = Order.where(designer_id: current_user.id)
  end

end