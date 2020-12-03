class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }

  has_one_attached :icon

  has_many :products
end
