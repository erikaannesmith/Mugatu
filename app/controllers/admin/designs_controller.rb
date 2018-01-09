class Admin::DesignsController < ApplicationController

  def show
    @design = Design.find(params[:format])
  end

  def approve
    @design = Design.find(params[:format])
    @design.active!
    redirect_to admin_dashboard_path(current_user)
    flash[:success] = "#{@design.title} has been approved"
  end

  def decline
    @design = Design.find(params[:format])
    @design.declined!
    redirect_to admin_dashboard_path(current_user)
    flash[:success] = "#{@design.title} has been declined"
  end

end