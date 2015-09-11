class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.float :price
      t.string :description
      t.integer :how_many
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :goods, [:user_id, :created_at]
  end
end
