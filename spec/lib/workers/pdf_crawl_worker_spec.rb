RSpec.describe PdfCrawlWorker do
  let(:worker){ PdfCrawlWorker.new }

  describe "#parse_ccc_pdf" do
    subject{ worker.parse_ccc_pdf(pdf_file) }

    let(:pdf_file){ "#{spec_dir}/data/ccc_privacy_present_companies_20141020.pdf" }

    its(:count){ should eq 81 }
    it{ should all(be_a_company) }
  end
end
