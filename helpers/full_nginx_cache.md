Enable NGINX cache for whole site
=================================

I will use 'craftup' as project name in examples.

You need to add lines to 'http' section of `nginx.conf`:

    proxy_cache_path /cache/craftup levels=1 keys_zone=pagecache:5m inactive=1m max_size=200m;
    log_format cache '$remote_addr <$cookie_session> $time_local $upstream_cache_status "$request" $status "$http_referer"';

Then you need to open your real site on the other port and launh cache on the 80 port.
There is example of virtual server settings:

    server {
      listen 8080;
      server_name craftup.ru;
      root /home/craftmaster/www/craftup/current/public;
      passenger_enabled on;
    }
    server {
      listen 80;
      server_name craftup.ru;
      location / {
        access_log /var/log/nginx/craftup-cache.log cache;
        proxy_cache_key $scheme$host$uri$is_args$args;
        proxy_cache pagecache;
        proxy_cache_use_stale updating;
        proxy_cache_lock on;
        proxy_cache_valid any 50s;
        proxy_ignore_headers X-Accel-Expires Expires Cache-Control Set-Cookie;
        proxy_pass http://craftup.ru:8080/;
      }
    }

And this is more complex example with 'gzip' and 'ae' from other projects:

    # 'http' section of nginx configuration
    proxy_cache_path /cache/krasmix levels=1 keys_zone=pagecache:5m inactive=1m max_size=200m;

    # 'server' section of nginx configuration
    location @backend {
      access_log /var/log/nginx/guide-cache.log cache;
      gzip off;
      set $ae "gzip";
      if ($http_accept_encoding !~* gzip) {
        set $ae "guzip";
      }
      gunzip on;
      proxy_cache_key $ae$scheme$host$uri$is_args$args;
      proxy_cache pagecache;
      proxy_cache_use_stale updating;
      proxy_cache_lock on;
      proxy_cache_valid any 5s;
      proxy_ignore_headers X-Accel-Expires Expires Cache-Control Set-Cookie;
      proxy_pass http://backend;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
    }
