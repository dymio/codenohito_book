Configure server for a Rails project
====================================

This guide describes how to create a new instance of Ruby on Rails application
on the server with Ruby, PostgreSQL and Nginx with Passenger installed.
There is [a guide](setup_debian_rails_server.md) to setup server like this.

We use [Mina](http://nadarei.co/mina) as deployment tool.

As example for this guide will be project where:

- "Example project" is projects name;
- system and database user name is `exampleuser`;
- name of database is `example_database`;
- staging domain is [example.codenohito.ru](http://example.codenohito.ru);
- production domain is [example.com](http://example.com);


Short description of the process
--------------------------------

1. Add DNS A-record for a necessary domain leading to the server ip-address;

2. Create system user.

3. Add project directory in `~/www/` and config files;

3. Add Nginx virtual server config;

4. Add PosgreSQL user and database;

6. Setup & deploy.


Add system user for the project
-------------------------------

__Under root__ create new user. Don't use the project name as name for the user.
But choose user name references to the project name. As example 'snowman' for
the 'SnegGroup project' or 'greghouse' for 'Klinika'.


    adduser exampleuser
    usermod -a -G www-data exampleuser

__Relogin under created user__ and add your rsa public key to authorized_keys:

    mkdir ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo '{content of your public rsa-key}' > authorized_keys
    chmod 600 ~/.ssh/authorized_keys

Now you can login to the user account from your local computer without
entering password.

Prepare connection to the repository (Atlassian Bitbucket as example):

    ssh git@bitbucket.org -A


Prepare directory of the application
------------------------------------

__Authorized as project's user__ create directory for the application and
a dummy page for testing and avoiding Nginx errors:

    mkdir -p ~/www/example/dummy/public
    cd ~/www/example/
    echo 'Example project dummy' > dummy/public/index.html
    ln -s dummy current

Create a config directory and add config files

    mkdir -p ~/www/example/shared/config
    vim ~/www/example/shared/config/application.yml
    vim ~/www/example/shared/config/database.yml

There is example of `application.yml`:

    SECRET_KEY_BASE: 011c78097304ae52c3c52e9070513da3818020b5aa881a5fc950af2b517068fce472e2193b61c782de054e48636ff3ee6a8d3ceef359e07a842b9fba1a40e83d
    mailer_smtp_password: "user_password"

There is an example of `database.yml`:

    production:
      adapter: postgresql
      encoding: unicode
      pool: 5
      database: example_database

If PostgreSQL user will have the same name as system user you need no username
and password in the settings.


Configure NGINX
---------------

__Under root user__ you need to create a new file for a project's servers config:

    vim /etc/nginx/sites-available/example

There is example config for a project with a staging instance but prepared
for fast switching to a production instance.

    ## Example project

    server {
        listen 80;
        listen [::]:80;

        server_name example.codenohito.ru example.com;
        root /home/exampleuser/www/example/current/public;

        client_max_body_size 64m;
        passenger_enabled on;

        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/htpasswd;

        # gzip config
        gzip_vary on;
        gzip_proxied any;
        gzip_min_length 256;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript application/x-javascript;

        #- Maybe we'll need rewrites from old urls to new after publishing.
        #- There are examples:
        # rewrite ^(/action/2014/11/23/matras).*$ http://example.com/offers/new_mattress permanent;
        # rewrite ^(/action).*$ http://example.com/offers permanent;
        # rewrite ^(/kontacts.html).*$ http://example.com/contacts permanent;
    }

    server {
        server_name www.example.com;
        rewrite ^(.*) http://example.com$1 permanent;
    }

For switching to the production instance just move staging domain to the second
virtual server (redirector) and remove auth_basic lines.

You might need to create file `/etc/nginx/htpasswd` for the basic auth.
Read more about it in Nginx
[documentation](http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html).
There is good
[online generator](http://www.htaccesstools.com/htpasswd-generator/).
An example of htaccess file content for user 'proekt' with password 'palenin':

    proekt:$apr1$6PTjpb3D$TJvLxdcH67uRT68C6Mp7J.

Create symbolic link to the file in the directory `/etc/nginx/sites-enabled`:

    cd /etc/nginx/sites-enabled
    ln -s ../sites-available/example example

Restart NGINX for apply this config

    service nginx restart

On this step you already can see dummy html on
[example.codenohito.ru](http://example.codenohito.ru)
if new DNS records of subdomen already active.


Create a PostgreSQL user and database
-------------------------------------

Enter to `psql` (PostgreSQL console) as `postgres` user:

    su - postgres
    psql

Create PostgreSQL user with the same name as created system user:

    CREATE USER exampleuser WITH PASSWORD 'S0me_#arD_PA$$W0RD';

Create database with correct collation and with new user as owner:

    CREATE DATABASE example_database WITH ENCODING 'UTF8' LC_COLLATE='ru_RU.UTF8' LC_CTYPE='ru_RU.UTF8' TEMPLATE=template0 OWNER exampleuser;

Log out from psql and postgres user:

    \q
    exit


Setup & the first deploy
------------------------

Make a correct mina config.
[Config from Mayak](https://github.com/dymio/mayak/blob/master/config/deploy.rb)
is the best example.
Run setup and then deploy, if setup gives no errors.

    mina setup
    mina deploy
    # or mina production deploy (depends on your settings)

Profit.
