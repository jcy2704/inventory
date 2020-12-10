class Sale < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :sale_groups, join_table: 'sale_groups_sales', foreign_key: 'sale_group_id'

  has_many :line_items, dependent: :destroy
end
