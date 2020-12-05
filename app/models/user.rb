# rubocop:disable Layout/LineLength

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' }

  validates :role, presence: true, inclusion: { in: %w[admin employee] }

  before_save :downcase_field

  has_one_attached :avatar
  has_many :transactions

  def admin?
    role == 'admin'
  end

  private

  def downcase_field
    username.downcase!
  end
end

# rubocop:enable Layout/LineLength
