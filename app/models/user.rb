class User < ActiveRecord::Base
  has_many :posts
  has_many :orders
  has_many :comments
  acts_as_followable
  acts_as_follower
  attachment :photo
  has_secure_password
  validates :first_name, :last_name, :user_name, :email, :password, presence: true
end
