class Designer::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:format])
  end

  def approve
    @application = Application.find(params[:format])
    @application.design.applications.each do |app|
      app.inactive!
    end
    @application.design.production!
    order = Order.create(
        application: @application, 
        design: @application.design,
        price: @application.price,
        due_date: @application.due_date,
        production_plan: @application.production_plan,
        designer_id: @application.design.user.id,
        producer_id: @application.user.id
    )
    if order.save!
      flash[:notice] = "Order ##{order.id} has been created for #{@application.design.title}!"
      redirect_to designer_order_path(current_user, order)
    else
      flash[:notice] = "Order could not be created, please try again!"
      redirect_to designer_design_applications_path(current_user, @application.design)
    end
  end

  def decline
    @application = Application.find(params[:format])
    @application.inactive!
    redirect_to designer_design_path(current_user, @application.design)
  end

end