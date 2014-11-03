RSpec::Matchers.define :be_a_company do |expected|
  match do |actual|
    return false unless actual.kind_of?(Company)
    return false unless actual.no > 0
    return false unless actual.company_name.present?
    return false unless actual.receipted_date.present?
    return false unless actual.destination_name.present?

    return false if expected[:receipted_date] && actual.receipted_date != expected[:receipted_date]

    true
  end
end

