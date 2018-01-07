class Designer::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:format])
  end

  def approve
    @application = Application.find(params[:format])
    byebug
    @application.design.applications.each do |app|
      app.inactive!
    end
  end

end