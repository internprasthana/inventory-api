class Device < ApplicationRecord
# :employee
  # validates :name, presence: true
  validates :service_tag, presence:true
  has_one :employee

 validates :name, presence: true,length: { minimum: 3 }
 validates :device_type, presence: true
end
