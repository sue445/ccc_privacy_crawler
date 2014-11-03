class PdfCrawlWorker
  def perform
    # TODO download pdf
    # TODO parse pdf
    # TODO import to DB
    # TODO notify
  end

  def download_ccc_pdf(dest_pdf_file)
    agent = Mechanize.new
    agent.get("http://qa.tsite.jp/faq/show/25129")

    download_link = agent.page.link_with(href: %r(/attachment_file/.+\.pdf))
    raise "Not found download_link" unless download_link

    pdf_content = agent.get_file(download_link.href)
    File.open(dest_pdf_file, "wb") do |file|
      file.write(pdf_content)
    end
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

    File.open(pdf_file, "rb") do |io|
      reader = PDF::Reader.new(io)

      reader.pages.each do |page|
        pdf_content << page.text
      end
    end

    pdf_content
  end

end
