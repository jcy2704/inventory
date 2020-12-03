class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :upc, presence: false
  validates :group_id, presence: true

  belongs_to :group
end
