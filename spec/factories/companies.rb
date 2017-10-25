FactoryBot.define do
  factory :company do
    sequence(:no)    { |n| n }
    company_name     { generate :random_str }
    receipted_date   { generate :random_ymd }
    destination_name { generate :random_str }

    factory :example_company do
      no               1
      company_name     "TSUTAYA・蔦屋書店"
      receipted_date   "2014/10/20"
      destination_name "提携先:TSUTAYAフランチャイズチェーン加盟企業"
    end
  end
end
