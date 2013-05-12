# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

employer = Employer.create(email: "employer@example.com", password: "password", password_confirmation: "password")
candidate = Candidate.create(email: "candidate@example.com", password: "password", password_confirmation: "password")

# Change me eventually (this is stolen from SJS)
categories = ["Accounting",
              "Administration and Office Support",
              "Advertising, Arts and Media",
              "Banking, Finance and Insurance",
              "Call Centre and Customer Service",
              "Construction",
              "Design and Architecture",
              "Education, Training and Childcare",
              "Engineering",
              "Farmwork, Agriculture Fishing and Forestry",
              "Government and Council",
              "HR and Recruitment",
              "Healthcare",
              "Hospitality and Tourism",
              "Household",
              "Information and Communication Technology",
              "Law",
              "Manufacturing, Transport and Logistics",
              "Marketing and Communications",
              "Not specified",
              "Retail",
              "Sales",
              "Science and Technology",
              "Sport and Recreation",
              "Trades Assistance"]

categories.each do |category|
  Category.find_or_create_by(:title => category)
end

types = ["Full time",
         "Part time",
         "Casual",
         "Contract",
         "One off"]

types.each do |type|
  Type.find_or_create_by(:title => type)
end

regions =  ["Northland",
            "Auckland",
            "Waikato",
            "Bay of Plenty",
            "Gisborne",
            "Hawke's Bay",
            "Taranaki",
            "Manawatu-Wanganui",
            "Wellington",
            "Tasman" ,
            "Nelson" ,
            "Marlborough" ,
            "West Coast" ,
            "Canterbury" ,
            "Otago" ,
            "Southland"]

regions.each do |region|
  Region.find_or_create_by(:name => region)
end

cities = { Region.find_by(:name => "Auckland").id => ["Auckland", "Other stuff"],
           Region.find_by(:name => "Wellington").id => ["Wellington", "Porirua"] }

cities.each do |region, cities|
  cities.each do |city|
    City.find_or_create_by(:region_id => region, :name => city)
  end
end
