class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  enum role: ["designer", "producer", "admin"]
end
