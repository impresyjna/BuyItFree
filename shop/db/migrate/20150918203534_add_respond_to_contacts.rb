class AddRespondToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :respond, :string
  end
end
