# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :region do
    sequence(:name) { |n| "Region #{n}" }
    cities FactoryGirl.build_list(:city, 5)
  end
end
