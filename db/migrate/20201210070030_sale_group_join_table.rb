class SaleGroupJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sales, :sale_groups do |t|
      t.index :sale_id
      t.index :sale_group_id
    end
  end
end
