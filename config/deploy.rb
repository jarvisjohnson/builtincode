require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
# require 'mina/npm'
require 'mina/whenever'
# require 'mina/scp'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'builtincode'
set :domain, 'builtincode-do'
set :user, fetch(:application_name)
set :deploy_to, "/home/#{fetch(:user)}/app"
set :repository, 'https://github.com/jarvisjohnson/builtincode.git'
set :branch, 'master'
set :rvm_use_path, '/etc/profile.d/rvm.sh'
set :app_root,   '/Users/swish/Dev/builtincode'   # Local path to application

# Optional settings:
#   set :user, 'foobar'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# Persist Paperclip uploads and config files: https://gist.github.com/stevenyap/9130807
# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# set :shared_paths, fetch(:shared_paths, []).push('config/application.yml')
set :shared_dirs, fetch(:shared_dirs, []).push('public/system')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/application.yml')

# Push config as well: https://github.com/codyeatworld/mina-recipes/blob/master/deploy/secrets.rb
###
### SECRETS
################################################################################


namespace :secrets do
  desc "Upload secret configuration files"
  task :upload do
    scp_upload("#{:app_root}/config/{application,secrets,database}.yml", "#{:deploy_to}/#{:shared_path}/config/", verbose: true)
  end
end

# http://stackoverflow.com/questions/29978631/how-do-i-prevent-mina-from-removing-images-uploaded-on-production-server
# set :shared_paths, %w[ files log private public/system tmp ]
# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  ruby_version = File.read('.ruby-version').strip
  raise "Couldn't determine Ruby version: Do you have a file .ruby-version in your project root?" if ruby_version.empty?
  # invoke :'rbenv:load'
  invoke :'rvm:use', ruby_version
end

task :setup do

  in_path(fetch(:shared_path)) do

    command %[mkdir -p config]

    # Create database.yml for MySQL if it doesn't exist
    path_database_yml = "config/database.yml"
    database_yml = %[production:
  database: #{fetch(:user)}
  adapter: mysql2
  pool: 5
  timeout: 5000]
    command %[test -e #{path_database_yml} || echo "#{database_yml}" > #{path_database_yml}]

    # Create secrets.yml if it doesn't exist
    path_secrets_yml = "config/secrets.yml"
    secrets_yml = %[production:\n  secret_key_base:\n    #{`rake secret`.strip}]
    command %[test -e #{path_secrets_yml} || echo "#{secrets_yml}" > #{path_secrets_yml}]
    
    # Remove others-permission for config directory
    command %[chmod -R o-rwx config]
  end

end

# run(:local){ 
#     desc 'upload shared files' 
#     fetch(:shared_paths, []).each do |linked_dir|
#       command "scp #{linked_dir} #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}/#{linked_dir}"
#     end
#   }

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    # invoke :'npm:run_build'
    # invoke :'npm run rwr-node-server'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'
    # invoke :'secrets:upload'    

    on :launch do
      command "sudo service #{fetch(:user)} restart"
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
