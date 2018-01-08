class Order < ActiveRecord::Base
  belongs_to :application
  belongs_to :design
  enum status: ["open", "shipped", "received", "closed"]
end