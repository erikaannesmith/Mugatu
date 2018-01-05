class Designer::DesignsController < ApplicationController

  def index
    @designs = current_user.designs
  end

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
      @design = current_user.designs.new(design_params)
      if @design.save!
        redirect_to designer_designs_path(current_user)
        flash[:notice] = "#{@design.title} has been add to your designs!"
      else
        redirect_to new_designer_design_path(current_user)
        flash[:notice] = "#{@design.title} could not be created, please try again."
      end
    end
  end

  def destroy
    @design = current_user.designs.find(params['format'])
    @design.destroy
    redirect_to designer_designs_path(current_user)
    flash[:notice] = "#{@design.title} has been removed from your designs."
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :image_url, :due_date, :price_range)
  end

end