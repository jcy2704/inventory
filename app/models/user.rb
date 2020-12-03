# rubocop:disable Layout/LineLength

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' }
  validates :role, presence: true, inclusion: { in: %w[admin user] }
  before_save :downcase_field

  def downcase_field
    username.downcase!
    role.downcase!
  end
end

# rubocop:enable Layout/LineLength
