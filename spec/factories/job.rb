# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "#{n}-job" }
    employer { FactoryGirl.build(:employer) }
    category
    type
    region

    contact_name "Tester"
    summary Faker::Lorem.paragraphs(2).join("\n\n")
    description Faker::Lorem.paragraphs(4).join("\n\n")
  end
end
