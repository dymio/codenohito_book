Rails Staging Environment
=========================

Sometimes you need to add new rails environment to existed development, test and production.
Right here I give you code for adding `staging` environment.

Solution for Ruby on Rails 4.2.0 with Mina as deploy gem and nginx + Passenger on the server.

1. Add new file `staging.rb` to folder `config/environments` of your application.
    Copy content of file `config/environments/production.rb` to created file.

2. Add setting 'rails_env' with value 'staging' to mina deploy config file:

        set :rails_env, 'staging'

    more complex example:

        set :domain, 'tulip.server' # 'staging.mamma-mia.ru'
        set :user, 'gondolina'
        set :deploy_to, '/home/gondolina/www/mamma_mia'
        set :branch, 'master'
        set :rails_env, 'staging'

3. Add 'passenger_app_env' option to Nginx config server section:

        server {
            listen 80;
            server_name staging.mamma-mia.ru;
            root /home/gondolina/www/mamma_mia/current/public;
            passenger_enabled on;
            passenger_app_env staging;
        }

Profit!
Right now you can add special setting to environment configuration and use special
environment conditions in the application code:

    if Rails.env == 'staging'
      http_basic_authenticate_with name: "some_username", password: "some_password"
    end
