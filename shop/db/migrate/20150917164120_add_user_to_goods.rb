class AddUserToGoods < ActiveRecord::Migration
  def change
    add_reference :goods, :user, index: true, foreign_key: true
    add_index :goods, [:user_id, :created_at]
  end
end
