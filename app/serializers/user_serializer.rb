class UserSerializer < ActiveModel::Serializer
  attributes :email, :id

    belongs_to :employee
 has_many :user_roles

end
