class AddOrderIdToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :order, index: true
  end
end
