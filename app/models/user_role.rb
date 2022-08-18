class UserRole < ApplicationRecord
  belongs_to :user, optional: true
end
