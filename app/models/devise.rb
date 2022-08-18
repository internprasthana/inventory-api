class Devise < ApplicationRecord
  belongs_to :employee, optional: true
end
