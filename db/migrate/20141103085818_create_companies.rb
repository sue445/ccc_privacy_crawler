class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :no
      t.string :company_name
      t.string :receipted_date
      t.text :destination_name
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
