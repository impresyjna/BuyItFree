class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :post_code
      t.string :city
      t.string :account_number
      t.string :company_name
      t.string :company_address
      t.string :company_post_code
      t.string :company_city
      t.string :regon
      t.string :nip
      t.string :krs
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :sellers, [:user_id, :created_at]
  end
end
