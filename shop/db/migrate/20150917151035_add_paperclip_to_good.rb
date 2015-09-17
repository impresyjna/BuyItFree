class AddPaperclipToGood < ActiveRecord::Migration
  def change
    add_attachment :goods, :photo  
  end
end
