class Producer::DesignsController < ApplicationController
 
  def index
    @designs = Design.where(status: 1)
  end

  def show
    @design = Design.find(params["format"])
  end

end