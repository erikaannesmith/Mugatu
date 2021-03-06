class Designer::DesignsController < ApplicationController

  def show
    @design = current_user.designs.find(params["format"])
  end

  def edit
    @design = current_user.designs.find(params["format"])    
  end

  def update
    @design = current_user.designs.find(params["id"])    
    @design.update(design_params)
    redirect_to designer_design_path(current_user, @design)    
  end

  def new
    @design = Design.new
  end

  def create
    if current_designer?  
      @design = current_user.designs.create(design_params)
      if @design.save!
        redirect_to designer_dashboard_path(current_user)
        flash[:success] = "#{@design.title} has been add to your designs!"
      else
        redirect_to new_designer_design_path(current_user)
        flash[:danger] = "#{@design.title} could not be created, please try again."
      end
    end
  end

  def destroy
    @design = current_user.designs.find(params['format'])
    @design.destroy
    redirect_to designer_dashboard_path(current_user)
    flash[:success] = "#{@design.title} has been removed from your designs."
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :due_date, :price_range, :image)
  end

  
end