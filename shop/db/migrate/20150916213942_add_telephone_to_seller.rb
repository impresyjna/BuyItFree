class AddTelephoneToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :telephone, :string
  end
end
