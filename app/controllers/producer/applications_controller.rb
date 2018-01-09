class Producer::ApplicationsController < ApplicationController

  def index
    @applications = current_user.applications
  end

  def show
    @application = Application.find(params["format"])
  end

  def new
    @design = Design.find(params["format"])
    @application = Application.new
  end

  def create
    if current_producer?
      design = Design.find(params[:design_id])
      @application = design.applications.create(application_params)
      @application.user = current_user
      if @application.save!
        redirect_to producer_designs_path(current_user)
        flash[:success] = "Your application to #{@application.design.title} has been submitted!"
      else
        redirect_to new_producer_design_application(current_user, @application.design)
        flash[:danger] = "Your application to #{@application.design} could not be submitted! Please try again!"
      end
    end
  end

  private

  def application_params
    params.require(:application).permit(:production_plan, :due_date, :price)
  end

end