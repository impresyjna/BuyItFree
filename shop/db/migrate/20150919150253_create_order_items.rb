class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :basket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.integer :how_many

      t.timestamps null: false
    end
  end
end
