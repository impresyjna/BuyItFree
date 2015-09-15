class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :post_code
      t.string :city

      t.timestamps null: false
    end
  end
end
