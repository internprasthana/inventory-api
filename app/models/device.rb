class Device < ApplicationRecord
  belongs_to :employee, optional: true

  validates :name, presence: true,length: { minimum: 3 }
  validates :device_type, inclusion: { in: %w(Laptop Charger Bag),
    message: "%{value} is not a valid type"}
  validates :service_tag,presence: true,length: { minimum: 8,maximum: 15 },uniqueness: true
end
