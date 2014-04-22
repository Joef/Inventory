class User < ActiveRecord::Base
  before_save { self.email = email.downcase }  
  validates :first_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  
end
