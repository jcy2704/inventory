class JoinTableSales < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sale_groups, :sales do |t|
      # t.index [:sale_group_id, :sale_id]
      # t.index [:sale_id, :sale_group_id]
    end
  end
end
