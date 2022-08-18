class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phonenumber, :emp_id
  has_one :user
end
