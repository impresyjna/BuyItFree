class RemoveRegonFromSeller < ActiveRecord::Migration
  def change
    remove_column :sellers, :regon, :string
  end
end
