class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  belongs_to :organizer, class_name: 'User', foreign_key: 'user_id'
  has_one_attached :icon

  validates :icon, presence: false, blob: {
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes
  }

  has_many :products
end
