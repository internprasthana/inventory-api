class DeviseSerializer < ActiveModel::Serializer

  attributes :name, :id
belongs_to :employee
end
