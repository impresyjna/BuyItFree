class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
