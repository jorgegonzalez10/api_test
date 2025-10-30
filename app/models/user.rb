class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid email" }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks
end
