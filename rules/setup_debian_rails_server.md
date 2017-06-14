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

Tested on Rails 4.2.8 application, based on Mayak.

April 2, 2017.


Locale
------

To setup correct locales for the system you need to run

    dpkg-reconfigure locales

Select `en_US.utf8` and `ru_RU.utf8`. The second one is necessary for
any operations with russian language. Database search and order as example.
`en_US.utf8` should been chosen as default locale for the system environment.
You might need to run `apt-get update && apt-get install locales` if
`dpkg-reconfigure locales` gives you errors.

Relogin and try `locale -a` to test locale. Should gives no errors, like:

    locale -a
      C
      C.UTF-8
      en_US.utf8
      POSIX
      ru_RU.utf8


Time
----

Check you have correct timezone with command

    date

If you need you can change timezone with comand:

    dpkg-reconfigure tzdata


SSH
---

Tune up the ssh config to avoid timeouts (helpfull for a long deploy processes).
Add to the `/etc/ssh/sshd_config` config file two lines

    ClientAliveInterval 600
    ClientAliveCountMax 3

The first one set 600 seconds (10 minutes) timeout before breaking a connection.
The second one set count of checkalive messages to 3.
In sum it will give 30 minutes before disconnection by server.
Do not forget to restart ssh server:

    /etc/init.d/ssh restart


Prepare system for the next steps
---------------------------------

    apt-get update && apt-get upgrade
    apt-get install gcc make build-essential curl git-core
    mkdir ~/packages


PostgreSQL installation
-----------------------

    apt-get install postgresql postgresql-client postgresql-contrib libpq-dev

Enter the PosgreSQL console as super-user under 'postgres' user:

    su - postgres
    psql

Hint: type `\q` to exit from the PostgreSQL console.


Ruby installation
-----------------

Install ruby from the sources, but install libraries first:

    apt-get install libc6 libc6-dev libssl-dev libgdbm3 libgdbm-dev libgmp10 \
                    libncurses5 zlib1g-dev libyaml-0-2 libyaml-dev \
                    libreadline6-dev libcurl4-openssl-dev libffi-dev libtinfo5

<!-- Maybe you will need libffi-ruby libpcrecpp0 libreadline-dev libxml2-dev
                         libxslt1-dev python-software-properties -->

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

<!--
Configure options for Nginx for manual install from the sources.
./configure --user=www-data --group=www-data --with-http_ssl_module \
            --with-http_realip_module --with-http_addition_module \
            --with-http_sub_module --with-http_dav_module \
            --with-http_flv_module --with-http_gzip_static_module \
            --with-mail --with-mail_ssl_module \
            --add-module=/usr/local/lib/ruby/gems/2.1.0/gems/passenger-4.0.56/ext/nginx
-->

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
        client_max_body_size 64m;
        passenger_enabled on;
    }
    server {
        # no-www redirect
        server_name www.example.com;
        rewrite ^(.*) http://example.com$1 permanent;
    }


ImageMagick the newest version installation
-------------------------------------------

Short way is install with apt-get:

    apt-get install imagemagick

But some old versions of ImageMagick darken images when processing.
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

<!-- Ubuntu
  Fix locale: `sudo locale-gen "ru_RU.UTF-8"` then `sudo dpkg-reconfigure locales`

  sudo apt-get update && apt-get upgrade

  Install PorgreSQL (the same as in this guide)

  sudo apt-get install gcc make build-essential curl git-core imagemagick

  Install Ruby. The same as in this guide but libraries:
  sudo apt-get install libc6 libc6-dev libssl-dev libgdbm3 libgdbm-dev \
                       libgmp10 libncurses5 zlib1g-dev libyaml-0-2 libyaml-dev \
                       libreadline6-dev libcurl4-openssl-dev libffi-dev \
                       libtinfo5 libffi-ruby libpcrecpp0 zlib1g-dev libssl-dev \
                       libreadline-dev libyaml-dev libxml2-dev libxslt1-dev \
                       libcurl4-openssl-dev python-software-properties \
                       libffi-dev libgdbm3 libgdbm-dev
  List isn't fully tested

  Install Nginx with passenger with official guide
  https://www.phusionpassenger.com/library/install/nginx/install/oss/
-->

<!-- Unicorn
  Config example:

    upstream app {
        # Path to Unicorn SOCK file, as defined previously
        server unix:/var/www/example/shared/sockets/unicorn.sock fail_timeout=0;
    }

    server {
      listen 80;
      listen [::]:80 ipv6only=on;
      root ...
      server_name ...

      try_files $uri/index.html $uri @app;

      access_log /var/log/nginx/example_access.log combined;
      error_log /var/log/nginx/example_error.log;

      location @app {
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass http://app;
      }

      error_page 404 /404.html;

      # redirect server error pages to the static page
      error_page 500 502 503 504 /500.html;
      location = /500.html {
        root /var/www/example/current/public;
      }

      client_max_body_size 64m;
    }

    server {
      # non-www redirect
      server_name www.example.com;
      rewrite ^(.*) http://example.com$1 permanent;
    }
-->