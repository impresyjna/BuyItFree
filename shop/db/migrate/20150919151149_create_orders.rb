class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :order_state, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.float :total_price
      t.integer :total_count

      t.timestamps null: false
    end
  end
end
