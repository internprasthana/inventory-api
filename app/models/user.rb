class User < ApplicationRecord
  has_secure_password

  has_many :user_roles
  belongs_to :employee,  optional: true



  validates :password,
            length: { minimum: 6 }





end
