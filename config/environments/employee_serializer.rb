class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :role
  belongs_to :user
  has_many :devises
end
