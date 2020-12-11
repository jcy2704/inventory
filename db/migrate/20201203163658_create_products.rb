class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price, precision: 8, scale: 2
      t.integer :quantity
      t.bigint :upc

      t.timestamps
    end

    execute 'ALTER TABLE products ADD CONSTRAINT qty_positive CHECK (quantity >= 0);'
    execute 'ALTER TABLE products ADD CONSTRAINT price_positive CHECK (price >= 0)'
    execute 'ALTER TABLE products ADD CONSTRAINT upc_length CHECK (upc >=100000000000 AND upc <= 999999999999)'
  end
end
