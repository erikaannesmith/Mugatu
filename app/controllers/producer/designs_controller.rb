class Producer::DesignsController < ApplicationController
 
  def show
    @design = Design.find(params["format"])
  end

end