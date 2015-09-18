class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :message
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :contacts, [:user_id, :created_at]
  end
end
