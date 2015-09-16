class RemoveFilledDataFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :filled_data, :boolean
  end
end
