class Design < ActiveRecord::Base
  belongs_to :user
  enum status: ["pending", "active", "production", "inactive", "declined"]
  has_many :applications

  # def self.count_by_status
  #   group(:status).count
  # end
end