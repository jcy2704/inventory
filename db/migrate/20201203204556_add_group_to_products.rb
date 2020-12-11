class AddGroupToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :group, null: false, foreign_key: true
  end
end
