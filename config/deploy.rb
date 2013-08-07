require 'bundler/capistrano'

set :application, "aesoft"
set :scm, :none
set :repository, "."
set :deploy_via, :copy

role :web, "server5.railshosting.cz"
role :app, "server5.railshosting.cz"
role :db,  "server5.railshosting.cz", :primary => true

set :deploy_to, "/home/aesoft/app/"
set :user, "aesoft"

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
