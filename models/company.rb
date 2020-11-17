# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  no               :integer          not null
#  company_name     :string           not null
#  receipted_date   :string           not null
#  destination_name :text
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_companies_on_company_name_and_receipted_date  (company_name,receipted_date) UNIQUE
#

class Company < ActiveRecord::Base
  LIST_PDF_URL = "https://ssl.help.tsite.jp/faq/show/43526?category_id=4281&site_domain=qa-tsite".freeze

  def self.import_new_companies(companies)
    new_companies = []
    companies.each do |company|
      next if Company.exists?(company_name: company.company_name, receipted_date: company.receipted_date)

      company.save!
      new_companies << company
    end
    new_companies
  end

  def notify_to_twitter
    message = "T-CARDの個人情報提供先に No.#{no}「#{company_name}」が追加されました(#{receipted_date}付) #{LIST_PDF_URL}"
    Padrino.logger.info message
    client.update(message)
  end

  private

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
      end
    end
end
