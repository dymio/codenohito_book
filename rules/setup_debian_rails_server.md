Setup a Debian production server for Rails project
==================================================

Debian GNU/Linux 8.0 (jessie) and Ruby 2.3.4.

Other major components:

- SSH
- PostgreSQL
- Nginx
- Phusion Passenger
- Imagemagick

All commands in this guide runs under root system user.

Tested for Rails 4.2.8 application, based on Mayak.
April 2, 2017.

<!--
Crocodile
-->

Locale
------

To setup correct locales for the system you need to run

    dpkg-reconfigure locales

Select `en_US.utf8` and `ru_RU.utf8`. The second one is necessary for
any operations with russian language. Database search and order as example.
`en_US.utf8` should been chosen as default locale for the system environment.
You might need to run `apt-get update && apt-get install locales` if
`dpkg-reconfigure locales` gives you errors.

After all command relogin and try `locale -a` — should give no errors, like:

    locale -a
      C
      C.UTF-8
      en_US.utf8
      POSIX
      ru_RU.utf8


SSH
---

Tune up the ssh config to avoid timeouts (helpfull for a long deploy processes).
Add to the `/etc/ssh/sshd_config` config file two lines

    ClientAliveInterval 600
    ClientAliveCountMax 3

The first one set 600 seconds (10 minutes) timeout before breaking connection.
The second one set count of checkalive message to 3 times.
In summ it will get a 30 minutes before disconnection by server.
DO not forget to restart ssh server:

    /etc/init.d/ssh restart


Prepare system for the next steps
---------------------------------

    apt-get update && apt-get upgrade
    apt-get install gcc make build-essential curl git imagemagick
    mkdir ~/packages


PostgreSQL installation
-----------------------

    apt-get install postgresql postgresql-client postgresql-contrib libpq-dev

There is an example of new PostgreSQL user and database creation:

    su - postgres
    psql

    CREATE USER exampleuser WITH PASSWORD 's0Me_rea11y-#Ard_pa$$word';
    CREATE DATABASE exampledatabase WITH ENCODING 'UTF8' LC_COLLATE='ru_RU.UTF8' LC_CTYPE='ru_RU.UTF8' TEMPLATE=template0 OWNER exampleuser;
    \q

    exit


Ruby installation
-----------------

Install ruby from the sources.
Install libraries first:

    apt-get install libc6 libc6-dev libssl-dev libgdbm3 libgdbm-dev libgmp10 \
                    libncurses5 zlib1g-dev libyaml-0-2 libyaml-dev \
                    libreadline6-dev libcurl4-openssl-dev libffi-dev libtinfo5

Maybe you will need `libffi-ruby` and `libpcrecpp0` too.

    cd ~/packages
    wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.gz
    tar xvpf ruby-2.3.4.tar.gz
    cd ruby-2.3.4
    ./configure
    make
    make install
    rm ~/packages/ruby-2.3.4.tar.gz
    gem update --system
    gem install bundler


Nginx installation with Passenger
---------------------------------

Full installation process described in the official
[guide](https://www.phusionpassenger.com/library/install/nginx/install/oss/jessie/).

    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
    apt-get install -y apt-transport-https ca-certificates
    sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger jessie main > /etc/apt/sources.list.d/passenger.list'
    apt-get update
    apt-get install -y nginx-extras passenger

Edit `/etc/nginx/nginx.conf` and uncomment `include /etc/nginx/passenger.conf;`.
Then restart Nginx (`service nginx restart`) and check the installation
is correct with commands:

    /usr/bin/passenger-config validate-install
    /usr/sbin/passenger-memory-stats

There is example of virtual server config with passenger enabled:

    server {
        listen 80;
        listen [::]:80;
        server_name example.com;
        root /home/exampleuser/www/example/current/public;
        passenger_enabled on;
    }
    server {
        # no-www redirect
        server_name www.example.com;
        rewrite ^(.*) http://example.com$1 permanent;
    }


ImageMagick the newest version installation
-------------------------------------------

Some old versions of ImageMagick darken images when processing.
To avoid this behavior install the newest version of ImageMagick from
the sources. The
[official instruction](https://www.imagemagick.org/script/install-source.php).
can help but it isn't enough.

    apt-get install checkinstall libx11-dev libxext-dev libpng12-dev \
                    libjpeg-dev libfreetype6-dev libxml2-dev
    apt-get build-dep imagemagick
    cd ~/packages

Find the last version source archive
at [http://www.imagemagick.org/download](http://www.imagemagick.org/download).
Then

    wget https://www.imagemagick.org/download/ImageMagick-6.9.8-3.tar.gz
    tar xvzf ImageMagick-6.9.8-3.tar.gz
    cd ImageMagick-6.9.8-3
    ./configure
    make
    make install
    ldconfig /usr/local/lib

Finally, verify the ImageMagick install worked properly with commands

    identify -version
    convert logo: logo.gif


Next steps
----------

There is [a guide](rails_server_config.md) to setup Rails project on the server.
