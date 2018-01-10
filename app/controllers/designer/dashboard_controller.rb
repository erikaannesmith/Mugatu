class Designer::DashboardController < ApplicationController
  before_action :set_partial, only: :show

  def show
    @designs = current_user.designs
    @orders = Order.where(designer_id: current_user.id)
  end

  private

  def set_partial
    default_partials = Hash.new("designs")
    valid_partials = {
      "orders" => "orders"
    }
    page = params[:page]
    @partial = default_partials.merge(valid_partials)[page]
  end

end