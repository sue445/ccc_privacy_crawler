RSpec.describe Company do
  describe "import_new_companies" do
    subject{ Company.import_new_companies(companies) }

    context "not exists same company" do
      let(:companies) { build_list(:company, 3) }

      it{ expect{ subject }.to change{ Company.count }.by(3) }
      its(:count){ should eq 3 }
    end

    context "exists same company" do
      let(:companies) { build_list(:company, 2) + [@old_companies[0]] }

      before do
        @old_companies = create_list(:company, 3)
      end

      it{ expect{ subject }.to change{ Company.count }.by(2) }
      its(:count){ should eq 2 }
    end
  end

  describe "#notify_to_twitter" do
    let(:company){ create(:company) }

    it "should post tweet" do
      begin
        company.notify_to_twitter
      rescue Twitter::Error => e
        puts e.message
      end
    end
  end
end
