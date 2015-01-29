Deploy Rails project with Mina
==============================

This document describes process of deploy Rails project with `mina` gem.
You must have mina config file before start. If your project based on Mayak you alredy have this file in the `config` directory and you need set correct params to it.
If not - read [Mina documentation](http://nadarei.co/mina/setting_up_a_project.html).

* **Prepare server** (just once, before first deploy):

    * create project directory on server;

    * create directories `shared/config` in the project directory;

    * add file `database.yml` to `shared/config`, you can use this example for PostgreSQL:

            production:
              adapter: postgresql
              encoding: unicode
              pool: 5
              database: database_name
              username: user_name
              password: user_password

    * configure your web-server for your project, as example - nginx & passenger virtual server config:

            ## project_name
            server {
                listen 80;
                server_name project_name.proektmarketing.ru;
                root /home/stager/www/project_name/current/public;
                passenger_enabled on;
            }
            server {
                # no-www redirect
                server_name  www.project_name.proektmarketing.ru;
                rewrite ^(.*) http://project_name.proektmarketing.ru$1 permanent;
            }

    * restart web-server.

    * run `mina setup` command in the development project directory;

* **Deploy**:

    * copy new static files, not included in repository, like `public/content` or some seed files to `shared/public` directory on the server;

    * probably you will need to run command `ssh-add` before deploy

    * run in the project development directory:

            mina deploy

    * if you need reset database on the server and seed it from the scratch after deploy:

        * you cannot drop and create database on the server, but you can drop all tables from db:

                psql database_name
                > SELECT 'DROP TABLE "' || tablename || '" cascade;' FROM pg_tables WHERE schemaname = 'public';
                > # copy all output you got from previous command and insert into command line
                > \q
        
        * if you want just migrate and seed database you need to `cd` in `current` folder on the server and run

                RAILS_ENV=production bin/rake db:migrate db:seed

        * or (if your project based on Mayak) run from project development directory

                mina rails:db_migrate rails:db_seed

        * if you want load dump, this command will help you:

                psql database_name < db_dump_file.sql

* Done
