class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :post_code
      t.string :city
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
      add_index :customers, [:user_id, :created_at]
  end
end
