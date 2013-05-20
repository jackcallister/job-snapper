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
      puts "Seeding categories from categories.yml.."
      categories = YAML.load_file(Rails.root.join('db', 'seeds', 'categories.yml'))
      categories.each do |title|
        Category.where(:title => title).first_or_create
      end
      puts "Done."
    end

    desc "Populate a list of types from a types.yml file"
    task :types => :environment do
      puts "Seeding job types from types.yml..."
      types = YAML.load_file(Rails.root.join('db', 'seeds', 'types.yml'))
      types.each do |type_title|
        Type.where(:title => type_title).first_or_create
      end
      puts "Done."
    end

    desc "Populate a list of Regions and associated Cities from a cities.yml file"
    task :cities => :environment do
      puts "Seeding regions and cities from cities.yml..."
      regions = YAML.load_file(Rails.root.join('db', 'seeds', 'cities.yml'))
      regions.each do |region_name, cities|
        Region.where(:name => region_name).first_or_create.tap do |region|
          "Ensured #{region.name} was present."
          cities.each do |city_name|
            region.cities.where(:name => city_name).first_or_create
            "Ensured #{city_name} was present in #{region.name}."
          end
        end
      end

      puts "Done."
    end

    desc "Populate a list of fake Employers"
    task :employers => :environment do
      puts "Creating 10 employers..."
      FactoryGirl.create_list(:employer, 10)
      puts "Done."
    end

    desc "Populate a list of fake jobs"
    task :jobs => :environment do
      region = Region.all.sample
      puts "Creating 100 jobs in #{region.name}..."
      FactoryGirl.create_list(:job, 100,
                              :employer => Employer.all.sample,
                              :category => Category.all.sample,
                              :region   => region,
                              :city     => region.cities.first
      )
      puts "Done."
    end
  end
end
