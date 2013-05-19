namespace :db do

  namespace :populate do

    desc "Populate all necessary models for development"
    task :all => [
         :categories,
         :regions,
         :cities,
         :employers,
         :jobs,
         :candidates
    ] do

          # No-op
    end


    desc "Populate a list of Category records from a categories.yml file"
    task :categories => :environment do
      categories = YAML.load_file(Rails.root.join('db', 'seeds', 'categories.yml'))
      categories.each do |name|
        Category.where(:title => title).first_or_create
      end
    end
  end
end
