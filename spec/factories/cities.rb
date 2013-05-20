# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "City #{n}" }
  end
end
