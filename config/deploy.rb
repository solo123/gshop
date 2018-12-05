require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'securerandom'

app_name = 'gshop'

set :domain, 'rb@sz.gshop'
set :deploy_to, "/home/rb/work/#{app_name}"
set :repository, "https://github.com/solo123/#{app_name}.git"
set :branch, 'master'

# set :shared_dirs, fetch(:shared_dirs, []).push('config')
set :shared_files, fetch(:shared_files, []).push('db/gshop.sqlite3', 'config/secrets.yml', 'config/puma.rb')

task :environment do
  invoke :'rbenv:load'
end

task :setup do
  command %{rbenv install 2.5.1}
  in_path './work' do
    command %{pwd}
    command %{cp -R app_shared/config #{fetch(:deploy_to)}/shared}
    command %{sed -i 's/SECRET/#{SecureRandom.hex(64)}/g' #{fetch(:deploy_to)}/shared/config/secrets.yml}
    command %{sed -i '1s/APP_NAME/#{app_name}/1' #{fetch(:deploy_to)}/shared/config/puma.rb}
  end
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :clean_shared_files
    invoke :'deploy:link_shared_paths'
    invoke :'rbenv:load'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        invoke :'rbenv:load'
        command %{bundle exec puma}
      end
    end
  end


  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run :local { say 'done' }
end
task :clean_shared_files do
  command %{rm config/puma.rb config/secrets.yml}
end

task :server_info do
  command %{ps aux|grep puma}
end
task :test do
  run :local do
    comment "test #{app_name}!"
    command %{curl http://sz.pooul.cn}
  end
end
# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/docs
