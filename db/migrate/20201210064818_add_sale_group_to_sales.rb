class AddSaleGroupToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :sale_group, null: false, foreign_key: true
  end
end
