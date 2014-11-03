# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  no               :integer          not null
#  company_name     :string(255)      not null
#  receipted_date   :string(255)      not null
#  destination_name :text
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_companies_on_no  (no) UNIQUE
#

class Company < ActiveRecord::Base
  def self.import_new_companies(companies)
    new_companies = []
    companies.each do |company|
      next if Company.exists?(no: company.no)

      company.save!
      new_companies << company
    end
    new_companies
  end
end
