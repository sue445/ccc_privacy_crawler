FactoryGirl.define do
  factory :company do
    sequence(:no)    { |n| n }
    company_name     { generate :random_str }
    receipted_date   { generate :random_ymd }
    destination_name { generate :random_str }
  end
end
