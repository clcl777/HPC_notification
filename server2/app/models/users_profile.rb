class UsersProfile < ApplicationRecord
  validates :line_id, presence: true, uniqueness: true
end
