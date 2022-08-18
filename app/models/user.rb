class User < ApplicationRecord
  has_secure_password

has_many :user_roles
  belongs_to :employee,  optional: true



validates :email, presence: true, uniqueness: true
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
validates :password,
          length: { minimum: 6 },
          if: -> { new_record? || !password.nil? }



def reset_password!(password)
       self.password = password
       save!
      end


end
