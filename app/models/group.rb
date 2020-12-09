class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  belongs_to :organizer, class_name: 'User', foreign_key: 'user_id'
  has_one_attached :icon

  has_many :products
end
