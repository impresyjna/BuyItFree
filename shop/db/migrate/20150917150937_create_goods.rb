class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.float :price
      t.string :description
      t.integer :how_many

      t.timestamps null: false
    end
  end
end
