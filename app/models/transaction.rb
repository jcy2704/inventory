class Transaction < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: :user_id
  has_many :line_items, dependent: :destroy
end
