# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'makerhub'
set :repo_url, 'git@github.com:MakerHubLive/staging-server.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/makerhub"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, ['bin', 'public/assets', 'vendor/bundle']).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Migration/Assets
set :migration_role, 'migrator'
set :conditionally_migrate, true
set :assets_roles, [:web]

set :rbenv_custom_path, "/home/ubuntu/.rbenv"
set :rbenv_ruby, '2.2.3'
set :rbenv_type, :user
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all

set :ndenv_custom_path, "/home/ubuntu/.ndenv"
set :ndenv_type, :user
set :ndenv_node, 'v6.0.0'
set :ndenv_map_bins, %w(npm node)
set :ndenv_roles, :all

set :puma_init_active_record, true

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
