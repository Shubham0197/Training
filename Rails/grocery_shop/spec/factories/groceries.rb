FactoryGirl.define do
  factory :grocery do
    sequence(:product) {|n|"Grocery_#{n}"}
    price 15.1
  end
end
