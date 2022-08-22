class Employee < ApplicationRecord
  has_one :user
  has_many :devices

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :emp_id, presence: true, uniqueness: true
  validates :designation, :phone_number, presence: true


  after_create :create_employee_user

  def create_employee_user_roles(roles)
     roles.each do |role|
       user.user_roles.create(roles: role)
     end
  end

  private

    def create_employee_user
      password = "#{email.at(0..3)}@123"
      User.create(email: email, password: password, employee_id: id)
    end

end
