class Design < ActiveRecord::Base
  belongs_to :user
  enum status: ["pending", "active", "production", "inactive", "declined"]
  has_many :applications
  mount_uploader :image, ImageUploader
  
end