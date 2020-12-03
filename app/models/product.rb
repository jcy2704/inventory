# rubocop:disable Layout/LineLength

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :upc, numericality: { only_integer: true, greater_than_or_equal_to: 100_000_000_000, less_than_or_equal_to: 999_999_999_999 }
end

# rubocop:enable Layout/LineLength
