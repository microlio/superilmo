# Copy settings
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression, :bzip2

set :application, "superilmo"
set :repository,  "git@github.com:microlio/superilmo.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# tunnel connection via public gateway
# note: ssh-key need to be your local key, not the one in melkinpaasi
set :gateway, "melkki.cs.helsinki.fi"
 
# needs to be set when rake is not in standard location
set :rake, "/opt/ruby-enterprise-1.8.7-2009.10/bin/rake"
 
# Server settings
 
set :deploy_to, "/home/ssamalet/superilmo_prj"
set :user, "ssamalet"
role :app, "rails.cs.helsinki.fi", :primary => true
role :db, "rails.cs.helsinki.fi", :primary => true
 
 
namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
 
 
after "deploy:symlink", "deploy:migrate"