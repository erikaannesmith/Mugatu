class Application < ActiveRecord::Base
  belongs_to :user
  enum status: ["active", "inactive"]
  belongs_to :design

end