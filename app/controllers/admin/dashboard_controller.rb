class Admin::DashboardController < ApplicationController

  def show
    @pending_designs = Design.where(status: 'pending')
  end

end