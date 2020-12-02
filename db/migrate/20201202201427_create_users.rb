class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :role, null: false, default: 'user',
               inclusion: { in: ['admin', 'user'] }

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
