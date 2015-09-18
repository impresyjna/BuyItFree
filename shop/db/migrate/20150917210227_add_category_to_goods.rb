class AddCategoryToGoods < ActiveRecord::Migration
  def change
    add_reference :goods, :category, index: true, foreign_key: true
    add_index :goods, [:category_id, :created_at]
  end
end
