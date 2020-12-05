class Transaction < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: :user_id
  belongs_to :product
end
