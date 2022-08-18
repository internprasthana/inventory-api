class UserSerializer < ActiveModel::Serializer
  attributes :id

    belongs_to :employee
    has_many :user_roles

end
