namespace :db do

  task :populate => :environment do

    require 'populator'
    require 'faker'

    Job.populate 100 do |job|
      job.employer_id = 1
      job.category_id = (1..25)
      job.type_id = (1..5)
      job.region_id = (1..6)
      job.contact_name = Faker::Name.name
      job.company = Faker::Company.name
      job.pay_rate_min = 16
      job.pay_rate_max = 25
      job.title = Populator.words(1..3).titleize
      job.summary = Populator.sentences(2..10)
      job.description = Populator.sentences(5..12)
      job.ideal_candidate = Populator.sentences(1..3)
      job.created_at = Time.now
    end
  end
end
