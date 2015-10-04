class AddIsGoodToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_good, :boolean
  end
end
