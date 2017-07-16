require "spec_helper"

RSpec.describe "/company" do # rubocop:disable RSpec/DescribeClass
  describe "get /" do
    before do
      create_list(:company, 5)
      get "/"
    end

    it { expect(last_response.status).to eq 200 }
  end
end
