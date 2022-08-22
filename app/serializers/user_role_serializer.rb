class UserRoleSerializer < ActiveModel::Serializer
  attributes :roles
  belongs_to :user
end
