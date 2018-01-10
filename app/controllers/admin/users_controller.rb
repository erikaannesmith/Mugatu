class Admin::UsersController < ApplicationController
  before_action :set_partial, only: :show

  def show
    @user = User.find(params[:format])
    @designer_orders = Order.where(designer_id: @user.id)
    @producer_orders = Order.where(producer_id: @user.id)   
  end

  private

  def set_partial
    default_partials = Hash.new('orders')
    valid_partials = {
      'other' => 'other'
    }
    page = params[:page]
    @partial = default_partials.merge(valid_partials)[page]
  end

end