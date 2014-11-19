class ChangeCompanyKeyOnCompany < ActiveRecord::Migration
  def self.up
    remove_index :companies, :no
    add_index    :companies, [:company_name, :receipted_date], unique: true
  end

  def self.down
    remove_index :companies, [:company_name, :receipted_date]
    add_index    :companies, :no, unique: true
  end
end
