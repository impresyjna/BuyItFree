class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.references :user, index: true, foreign_key: true
      t.float :total_price
      t.integer :total_count

      t.timestamps null: false
    end
  end
end
