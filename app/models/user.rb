class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :role, presence: true, inclusion: { in: %w[admin user] }
end
