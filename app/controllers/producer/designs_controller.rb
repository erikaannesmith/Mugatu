class Producer::DesignsController < ApplicationController
 
  def index
    @designs = Design.where(status: 'active')
  end

  def show
    @design = Design.find(params["format"])
  end

end