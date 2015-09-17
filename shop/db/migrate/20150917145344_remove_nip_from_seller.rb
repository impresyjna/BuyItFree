class RemoveNipFromSeller < ActiveRecord::Migration
  def change
    remove_column :sellers, :nip, :string
  end
end
