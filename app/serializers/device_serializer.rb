class DeviceSerializer < ActiveModel::Serializer
  attributes :name, :device_type, :os, :service_tag

  belongs_to :employee
end
