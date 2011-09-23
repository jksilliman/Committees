set :application, "committees"
set :repository,  "github.com/jksilliman/Committees.git"
set :scm, :git
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/committees"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
server "sg.uchicago.edu", :app, :web, :db, :primary => true
set :user, "jksilliman"
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
