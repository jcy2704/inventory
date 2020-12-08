# rubocop:disable Layout/LineLength

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' }

  validates :role, presence: true, inclusion: { in: %w[admin employee] }

  has_one_attached :avatar
  has_many :sales

  def admin?
    role == 'admin'
  end
end

# rubocop:enable Layout/LineLength
