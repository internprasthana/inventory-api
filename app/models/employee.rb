class Employee < ApplicationRecord
  has_many :devises
  has_one :user

  # validates :email, presence: true, uniqueness: true
  # validates :emp_id, presence: true, uniqueness: true
  # validates :role, presence: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :emp_id, presence: true, uniqueness: true
  validates :role, presence: true




end
