class Designer::RatingsController < ApplicationController

  def new
    order = Order.find(params["format"])
    @rating = order.ratings.new
  end

  def create
    order = Order.find(params[:order_id])
    @rating = order.ratings.create(rating_params)
    if @rating.save!
      redirect_to designer_order_path(current_user, order)
      flash[:success] = "Thank you for rating Order ##{order.id}"
    else
      redirect_to new_designer_order_rating_path(current_user, order)
      flash[:notice] = "Rating could not be saved, please try again!"
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:accuracy, :efficiency)
  end


end