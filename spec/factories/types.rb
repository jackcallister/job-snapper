# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :type do
    title { ["Full Time", "Part Time", "Contract"].sample }
  end
end
