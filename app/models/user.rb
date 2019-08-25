require 'bcrypt'

class User < ApplicationRecord

  has_many :posts
  has_many :friendships, class_name: "Friendship", foreign_key: "user_id"
  has_many :friends, through: :friendships


  has_secure_password

  # validates_uniqueness_of :username
  validates :username, presence: true
  validates :password, presence: true

end
