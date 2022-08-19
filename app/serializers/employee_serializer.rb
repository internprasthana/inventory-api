class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :designation

  has_one :user, serializer: UserSerializer
  has_many :devices
end
