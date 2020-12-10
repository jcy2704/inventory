class Sale < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :sale_groups

  has_many :line_items, dependent: :destroy

  scope :not_grouped, -> { joins('LEFT JOIN sale_groups_sales sg ON sg.sale_id = sales.id').where('sg.sale_id IS NULL') }
end
