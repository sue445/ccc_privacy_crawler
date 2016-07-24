class CreateCompanies < ActiveRecord::Migration[4.2]
  def self.up
    create_table :companies do |t|
      t.integer :no,             null: false
      t.string  :company_name,   null: false
      t.string  :receipted_date, null: false
      t.text    :destination_name
      t.timestamps
    end

    add_index :companies, :no, unique: true
  end

  def self.down
    drop_table :companies
  end
end
