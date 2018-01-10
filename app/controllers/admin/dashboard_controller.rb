class Admin::DashboardController < ApplicationController
  before_action :set_partial, only: :show

  def show
    @designs = Design.where.not(status: 'pending')
    @pending_designs = Design.where(status: 'pending') 
    @orders = Order.all 
  end

  private

  def set_partial
    default_partials = Hash.new("all")
    valid_partials = {
      "pending" => "pending",
      "orders" => "orders"
    }
    page = params[:page]
    @partial = default_partials.merge(valid_partials)[page]
  end

end