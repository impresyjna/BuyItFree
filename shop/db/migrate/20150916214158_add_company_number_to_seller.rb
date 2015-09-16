class AddCompanyNumberToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :company_number, :string
  end
end
