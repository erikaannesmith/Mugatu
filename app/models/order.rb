class Order < ActiveRecord::Base
  belongs_to :application
  belongs_to :design
  has_many :ratings
  enum status: ["open", "shipped", "received", "closed"]

  def total_rating
    (ratings.first.efficiency + ratings.first.accuracy) / 2
  end
end