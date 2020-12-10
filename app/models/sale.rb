class Sale < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :sale_groups

  has_many :line_items, dependent: :destroy
end
