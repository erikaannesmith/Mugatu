class Admin::DashboardController < ApplicationController

  def show
    @designs = Design.where.not(status: 'pending')
    @pending_designs = Design.where(status: 'pending') 
    @orders = Order.all 
  end

end