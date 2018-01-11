class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  enum role: ["designer", "producer", "admin"]
  has_many :designs
  has_many :applications

  def self.from_omniauth(auth)
    user = User.where(username: auth["info"]["email"]).first
    if user && user.token != auth["credentials"]["token"]
      user.token = auth["credentials"]["token"]
      user.save
    elsif user.nil?
      user = User.create(username: auth["info"]["email"],
      name: auth["info"]["name"],
      token: auth["credentials"]["token"],
      token_expiration: auth["credentials"]["expires_at"],
      password: 'n/a')
      user.save!
    end
    user
  end

  def user_rating
    orders = Order.where(status: 2, producer_id: self.id)
    totals = orders.map do |order|
      order.total_rating 
    end.sum
    totals / orders.count
  end
end
