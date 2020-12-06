class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :transaction
end
