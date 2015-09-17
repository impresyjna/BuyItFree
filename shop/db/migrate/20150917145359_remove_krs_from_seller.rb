class RemoveKrsFromSeller < ActiveRecord::Migration
  def change
    remove_column :sellers, :krs, :string
  end
end
