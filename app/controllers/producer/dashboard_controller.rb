class Producer::DashboardController < ApplicationController
  before_action :set_partial, only: :show

  def show
    @applications = current_user.applications 
    @orders = Order.where(producer_id: params[:id]) 
    @designs = Design.where(status: 1)
  end

  private

  def set_partial
    default_partials = Hash.new("applications")
    valid_partials = {
      "orders" => "orders",
      "designs" => "designs"
    }
    page = params[:page]
    @partial = default_partials.merge(valid_partials)[page]
  end
end