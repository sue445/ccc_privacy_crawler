RSpec.describe PdfCrawlWorker do
  let(:worker){ PdfCrawlWorker.new }

  describe "#perform" do
    subject{ worker.perform }

    before do
      # don't tweet
      allow_any_instance_of(Company).to receive(:notify_to_twitter)
    end

    it { expect{ subject }.not_to raise_error }
  end

  describe "#download_ccc_pdf" do
    subject!{ worker.download_ccc_pdf(dest_pdf) }

    include_context "uses temp dir"

    let(:dest_pdf){ temp_dir_path.join("ccc.pdf") }

    it{ expect(dest_pdf).to be_exist }
    it{ expect(dest_pdf).to be_file }
    it{ expect(dest_pdf.size).to be > 0 }
  end

  describe "#parse_ccc_pdf" do
    subject{ worker.parse_ccc_pdf(pdf_file) }

    let(:pdf_file){ "#{spec_dir}/data/ccc_privacy_present_companies_20141020.pdf" }

    its(:count){ should eq 81 }
    it{ should all(be_a_company(receipted_date: "2014/10/20")) }
  end
end
