class User < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip_code
  validates_presence_of :password_digest, require: true
  validates :email, uniqueness: true, presence: true

  has_secure_password
end
