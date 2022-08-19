class User < ApplicationRecord
  has_secure_password
  has_many :user_roles
  belongs_to :employee
  validates :password,
            length: { minimum: 6 }
end
