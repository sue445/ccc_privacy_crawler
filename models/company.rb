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

require 'pdf/reader'

class Company < ActiveRecord::Base
  def self.parse_ccc_pdf(pdf_file)
    companies = []
    read_pdf(pdf_file).each_line do |line|
      line = line.strip

      matched_data = %r(
        ^(?<no>[0-9]+)\s*
        (?<company_name>.+)\s*
        (?<receipted_date>[0-9]{4}/[0-9]{1,2}/[0-9]{1,2})
        (?<destination_name>.+)$)x.match(line)
      next unless matched_data

      companies << Company.new(
        no:               matched_data[:no].to_i,
        company_name:     matched_data[:company_name].strip,
        receipted_date:   matched_data[:receipted_date].strip,
        destination_name: matched_data[:destination_name].strip,
      )
    end

    companies
  end

  def self.read_pdf(pdf_file)
    pdf_content = ""

    File.open(pdf_file, "rb") do |io|
      reader = PDF::Reader.new(io)

      reader.pages.each do |page|
        pdf_content << page.text
      end
    end

    pdf_content
  end
  private_class_method :read_pdf

end
