Deploy Rails project with Mina
==============================

This document describes process of deploy Rails project with `mina` gem.
You must have mina config file before start. If your project based on Mayak you alredy have this file in the `config` directory and you need set correct params to it.
If not - read [Mina documentation](http://nadarei.co/mina/setting_up_a_project.html).

Before deploy you need to configure server for the project.
Full process of configuring you can read in [configure server for Rails project instruction](rails_server_config.md).

After correct configuring, and running `mina setup` command you can deploy.


Deploy process
--------------

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

Done
