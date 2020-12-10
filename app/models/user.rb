# rubocop:disable Layout/LineLength

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' }

  validates :role, presence: true, inclusion: { in: %w[admin employee] }

  has_one_attached :avatar

  validates :avatar, presence: false, blob: {
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes
  }

  has_many :sales
  has_many :groups
  has_many :sale_groups

  def admin?
    role == 'admin'
  end
end

# rubocop:enable Layout/LineLength
