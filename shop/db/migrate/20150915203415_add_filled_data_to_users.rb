class AddFilledDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filled_data, :boolean, default: false
  end
end
