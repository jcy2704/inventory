class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    sum = 0
    line_items.each do |item|
      sum += item.total_price
    end
    sum
  end
end
