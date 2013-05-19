namespace :db do

  namespace :populate do

    desc "Populate all necessary models for development"
    task :all => [
         :categories,
         :types,
         :cities,
         :employers,
         :jobs
    ] do

          # No-op
    end


    desc "Populate a list of Category records from a categories.yml file"
    task :categories => :environment do
      categories = YAML.load_file(Rails.root.join('db', 'seeds', 'categories.yml'))
      categories.each do |title|
        Category.where(:title => title).first_or_create
      end
    end

    desc "Populate a list of types from a types.yml file"
    task :types => :environment do
      types = YAML.load_file(Rails.root.join('db', 'seeds', 'types.yml'))
      types.each do |type_title|
        Type.where(:title => title).first_or_create
      end
    end

    desc "Populate a list of Regions and associated Cities from a cities.yml file"
    task :cities => :environment do
      regions = YAML.load_file(Rails.root.join('db', 'seeds', 'cities.yml'))
      regions.each do |region_name, cities|
        Region.where(:name => region_name).first_or_create.tap do |region|
          cities.each do |city_name|
            region.cities.where(:name => city_name).first_or_create
          end
        end
      end
    end

    desc "Populate a list of fake Employers"
    task :employers => :environment do
      FactoryGirl.create_list(:employer, 10)
    end

    desc "Populate a list of fake jobs"
    task :jobs => :environment do
      FactoryGirl.create_list(:job, 100,
                              :employer => Employer.sample,
                              :category => Category.sample,
                              :city     => City.sample
      )
    end
  end
end
