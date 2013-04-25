require 'capistrano/ext/multistage'
set :application, "job-snapper"
set :repository,  "git@github.com:jarsbe/job-snapper.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :stages, %w(production staging)
set :default_stage, "staging"
set :deploy_via, :copy
set :copy_cache, true
set :user, "jobsnapper"
set :use_sudo, false
set :port, 4848

before "deploy:assets:precompile", "init:link_database_conf"

role :web, "198.199.97.111"                          # Your HTTP server, Apache/etc
role :app, "198.199.97.111"                          # This may be the same as your `Web` server
role :db,  "198.199.97.111", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :init do
  task :link_database_conf, :except => { :no_release => true } do
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end
