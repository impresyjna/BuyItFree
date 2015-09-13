class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :how_many

      t.timestamps null: false
    end
  end
end
