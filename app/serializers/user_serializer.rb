class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  belongs_to :employee
  has_many :user_roles, serializer: UserRoleSerializer
end
