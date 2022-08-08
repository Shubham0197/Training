FactoryGirl.define do
  factory :aircraft do
    sequence(:name){|n| "Airmax-#{n}"}
    cruising_range 1300
  end
end
