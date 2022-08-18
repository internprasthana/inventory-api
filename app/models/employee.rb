class Employee < ApplicationRecord
  has_many :devises
  has_one :user

  # validates :email, presence: true, uniqueness: true
  # validates :emp_id, presence: true, uniqueness: true
  # validates :role, presence: true




end
