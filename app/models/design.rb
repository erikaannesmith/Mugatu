class Design < ActiveRecord::Base
  belongs_to :user
  enum status: ["pending", "active", "production", "inactive", "declined"]
end