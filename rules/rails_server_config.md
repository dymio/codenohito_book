Configure server for Rails project
==================================

Your task is create staging instance of our project (web-application) on the server.
But you also need do preparations for future production instance and fast switching from staging.

On our typical server we have NGINX web-server with Phusion Passenger and PostgresSQL.
Deployment tool — [Mina](http://nadarei.co/mina).

By default we use subdomen of 'proektmarketing.ru' for staging instance.
And your **first step** is creating this subdomen and set his DNS `A` record with server IP adress.

In this document staging domen will be `example.proektmarketing.ru`.
Production domen will be `example.com`.
Name of project in this document — "Example project".
In a real project you must use correct semantic name.


Short description of process
----------------------------

1. Создаём пользователя под проект с именем, намекающим на название проекта, но с ним не совпадающее.
   Например, showman для проекта SnegGroup или greghouse для проекта Klinika.

2. Создаём директорию будущего проекта в `~/www/`.

3. Добавляем конфиг server для проекта.

4. Добавляем PostgreSQL пользователя для проекта, имя которого совпадает с именем созданного пользователя системы, но пароль другой.

5. Добавляем базу данных для проекта.

6. Setup и деплой.


Add system user special for the project
---------------------------------------

Under root create new user:

    adduser exampleuser
    usermod -a -G www-data exampleuser

Under new user add your rsa key to ssh's authorized_keys:

    mkdir ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    vim authorized_keys
    # add the line with content of `id_rsa.pub` from client
    chmod 600 ~/.ssh/authorized_keys

Right now you have access to user from your local computer without entering password.


Prepare directory of project
----------------------------

Create directory for the project on the server under created user:

    mkdir -p ~/www/example

Then you need to create dummy page for testing before first deployment:

    mkdir -p ~/www/example/dummy/public
    vim ~/www/example/dummy/public/index.html
    # Any text inside file
    ln -s ~/www/example/dummy ~/www/example/current


Configure NGINX
---------------

Under root user you need to create new file in available sites NGINX directory:

    vim /etc/nginx/sites-available/example

File contents virtual server config for our project.
By default we use production domen without 'www' and subdomen of 'proektmarketing.ru' for staging version:

    ## Example project

    server {
        listen 80;
        server_name example.proektmarketing.ru example.com;
        root /home/exampleuser/www/example/current/public;
        passenger_enabled on;

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
        # non-www redirect
        server_name www.example.com;
        rewrite ^(.*) http://example.com$1 permanent;
    }

    # server {
    #     # from staging redirect
    #     server_name example.proektmarketing.ru;
    #     rewrite ^(.*) http://example.com$1 permanent;
    # }

    # server {
    #     # old version
    #     server_name old.example.com;
    #     root /home/exampleuser/www/old_example;
    # }

Create symbolic link of file in directory `/etc/nginx/sites-enabled`:

    cd /etc/nginx/sites-enabled
    ln -s ../sites-available/example example

Restart NGINX for using this config:

    service nginx restart

On this step you already can see dummy html on
[example.proektmarketing.ru](http://example.proektmarketing.ru)
if new DNS records of subdomen already active.


Create a PostgreSQL user and database
-------------------------------------

Under root user enter to `psql` (PostgreSQL console) as `postgres` user:

    su - postgres
    psql

Create PostgreSQL user for the application with same username as created system user:

    CREATE USER exampleuser WITH PASSWORD 'S0me_HarD_PASSW0RD';

Create new database with correct collation and with new user as owner:

    CREATE DATABASE example_database WITH ENCODING 'UTF8' LC_COLLATE='ru_RU.UTF8' LC_CTYPE='ru_RU.UTF8' TEMPLATE=template0 OWNER exampleuser;

Log out from psql and postgres user:

    \q
    exit


Create database config for the application
------------------------------------------

Create config directory for the project on the server under created user:

    mkdir -p ~/www/example/shared/config

Create database config file:

    vim ~/www/example/shared/config/database.yml

Add config to file with correct database name:

    production:
      adapter: postgresql
      encoding: unicode
      pool: 5
      database: example_database

By default you don't need to set username and password if username of PosgreSQL user the same as current system user.


Prepare connection to the repository
------------------------------------

Under created user run command

    ssh git@bitbucket.org -A

Instead 'git@bitbucket.org' must be user@domen of your repository (if you use not Bitbucket of course).
This step will save you from future errors in deploy process.


First deploy
------------

Make a correct `mina` config.
[Config from Mayak](https://github.com/dymio/mayak/blob/master/config/deploy.rb) is the best example.

Run `mina setup`.

If all settings are correct this command will not give you any errors.

Run `mina deploy` or `mina deploy to=production` (depends on you settings).

Profit.
