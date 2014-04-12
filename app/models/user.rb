class User < ActiveRecord::Base
  validates :first_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  
  
end
