# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  no               :integer
#  company_name     :string(255)
#  receipted_date   :string(255)
#  destination_name :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Company < ActiveRecord::Base

end
