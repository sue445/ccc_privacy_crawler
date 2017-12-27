RSpec.describe Company do
  describe "import_new_companies" do
    subject { Company.import_new_companies(companies) }

    context "not exists same company" do
      let(:companies) { build_list(:company, 3) }

      it { expect { subject }.to change { Company.count }.by(3) }
      its(:count) { should eq 3 }
    end

    context "exists same company" do
      let(:companies) { build_list(:company, 2) + [@old_companies[0]] }

      before do
        @old_companies = create_list(:company, 3)
      end

      it { expect { subject }.to change { Company.count }.by(2) }
      its(:count) { should eq 2 }
    end

    context "exists same company (no is not same)" do
      before do
        create(:company, no: 1, company_name: "company1", receipted_date: "2014/11/19", destination_name: "destination1")
        create(:company, no: 2, company_name: "company2", receipted_date: "2014/11/19", destination_name: "destination2")
      end

      let(:companies) do
        [
          build(:company, no: 1, company_name: "company1", receipted_date: "2014/11/19", destination_name: "destination1"),
          new_company,
          build(:company, no: 3, company_name: "company2", receipted_date: "2014/11/19", destination_name: "destination2"),
        ]
      end

      let(:new_company) { build(:company, no: 2, company_name: "company3", receipted_date: "2014/11/20", destination_name: "destination3") }

      it { should eq [new_company] }
      it { expect { subject }.to change { Company.count }.by(1) }
    end
  end

  describe "#notify_to_twitter" do
    let(:company) { create(:company) }

    it "posts tweet" do
      
      company.notify_to_twitter
    rescue Twitter::Error => e
      puts e.message
      
    end
  end
end
