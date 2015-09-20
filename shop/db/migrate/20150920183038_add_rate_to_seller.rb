class AddRateToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :rate, :float
  end
end
