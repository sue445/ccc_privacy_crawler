class PdfCrawlWorker
  def perform
    dest_pdf_file = Padrino.root("tmp", "ccc.pdf")
    download_ccc_pdf(dest_pdf_file)

    companies = parse_ccc_pdf(dest_pdf_file)
    raise "Could not get companies in pdf table (changed pdf format?)" if companies.empty?

    new_companies = Company.import_new_companies(companies)

    if new_companies.empty?
      Padrino.logger.info "not found new companies"
    else
      new_companies.each(&:notify_to_twitter)
      Padrino.logger.info "Add #{new_companies.count} companies"
    end
  end

  def download_ccc_pdf(dest_pdf_file)
    agent = Mechanize.new
    agent.get(Company::LIST_PDF_URL)

    download_link = agent.page.link_with(href: %r{^/usr/file/attachment/.+\.pdf})
    raise "Not found download_link" unless download_link

    pdf_content = agent.get_file(download_link.href)
    File.binwrite(dest_pdf_file, pdf_content)
  end

  def parse_ccc_pdf(pdf_file)
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

  private

    def read_pdf(pdf_file)
      pdf_content = ""

      reader = PDF::Reader.new(pdf_file)
      reader.pages.each do |page|
        pdf_content << page.text
      end

      pdf_content
    end
end
