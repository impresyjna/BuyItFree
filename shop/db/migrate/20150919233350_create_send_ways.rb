class CreateSendWays < ActiveRecord::Migration
  def change
    create_table :send_ways do |t|
      t.string :name
      t.references :good, index: true, foreign_key: true
      t.integer :how_many_days
      t.float :price

      t.timestamps null: false
    end
  end
end
