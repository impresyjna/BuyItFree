class AddPaperclipToGood < ActiveRecord::Migration
  def change
    add_attachment :goods, :image  
  end
end
