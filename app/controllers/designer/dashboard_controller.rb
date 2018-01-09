class Designer::DashboardController < ApplicationController

  def show
    @designs = current_user.designs
  end

end