# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
employer = Employer.create(email: "employer@example.com", password: "password", password_confirmation: "password")
candidate = Candidate.create(email: "candidate@example.com", password: "password", password_confirmation: "password")

categories = ["Accounting", "Administration and Office Support", "Advertising, Arts and Media", "Banking, Finance and Insurance", "Call Centre and Customer Service", "Construction", "Design and Architecture", "Education, Training and Childcare", "Engineering", "Farmwork, Agriculture Fishing and Forestry", "Government and Council", "HR and Recruitment", "Healthcare", "Hospitality and Tourism", "Household", "Information and Communication Technology", "Law", "Manufacturing, Transport and Logistics", "Marketing and Communications", "Not specified", "Retail", "Sales", "Science and Technology", "Sport and Recreation", "Trades Assistance"]

categories.each do |category|
  Category.find_or_create_by(:title => category)
end
