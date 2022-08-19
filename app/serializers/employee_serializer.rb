class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :designation

  has_one :user
end
