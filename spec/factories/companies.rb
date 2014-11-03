FactoryGirl.define do
  factory :company do
    sequence(:no){ |n| n }
  end
end
