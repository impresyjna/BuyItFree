class AddSendWayToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :send_way, index: true, foreign_key: true
  end
end
