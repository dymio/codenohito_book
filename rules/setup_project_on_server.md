Setup project on Debian server with NGINX ans Passenger
=======================================================

Create file named as project name in `/etc/nginx/sites-available` directory:

    vim /etc/nginx/sites-available/example

Content of file:

    ## Example
    server {
        listen 80;
        server_name www.example.com example.proektmarketing.ru;
        root /home/greghouse/www/klinika/current/public;
        passenger_enabled on;

    #    rewrite ^(/action).*$ http://www.clinsev.ru/clinics/v-severnom/offers permanent;
    #    rewrite ^(/kontacts.html).*$ http://www.clinsev.ru/contacts permanent;
    #    rewrite ^(/proezd.html).*$ http://www.clinsev.ru/contacts permanent;
    #    rewrite ^(/dokument.html).*$ http://www.clinsev.ru/clinics/v-severnom/documents permanent;
    #    rewrite ^(/licenzii.html).*$ http://www.clinsev.ru/clinics/v-severnom/documents permanent;
    #    rewrite ^(/vopros.html).*$ http://www.clinsev.ru/faq permanent;
    #    rewrite ^(/otzivi.html).*$ http://www.clinsev.ru/faq permanent;
    #    rewrite ^(/articles).*$ http://www.clinsev.ru/publications permanent;
    #    rewrite ^(/nevrolog.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/nevrologiya permanent;
    #    rewrite ^(/endokrinolog.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/endokrinologiya permanent;
    #    rewrite ^(/ortoped-hirurg-baev.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/travmatolog-ortoped permanent;
    #    rewrite ^(/ginekolog.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/ginekologiya permanent;
    #    rewrite ^(/diagnostika.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/terapevt permanent;
    #    rewrite ^(/mammolog-onkolog-golberg.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/onkolog-mammolog permanent;
    #    rewrite ^(/vrosshiy-nogot.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/hirurgiya permanent;
    #    rewrite ^(/urolog-troyakov.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/urologiya permanent;
    #    rewrite ^(/dermatovenerolog-boguslavskaya.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dermatovenerologiya permanent;
    #    rewrite ^(/terapevt-malkovish.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/terapevt permanent;
    #    rewrite ^(/vrach-hirurg.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/hirurgiya permanent;
    #    rewrite ^(/travmatolog-ortoped.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/travmatolog-ortoped permanent;
    #    rewrite ^(/vrach-uzd-ogincova.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/mammolog.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/onkolog-mammolog permanent;
    #    rewrite ^(/dms.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi-terapevta.html).*$ http://www.clinsev.ru/services/terapevt permanent;
    #    rewrite ^(/uslugi-endokrinologa.html).*$ http://www.clinsev.ru/services/endokrinologiya permanent;
    #    rewrite ^(/uslugi-nevrologa.html).*$ http://www.clinsev.ru/services/nevrologiya permanent;
    #    rewrite ^(/uslugi/165-uzi-arterij-i-ven-nizhnih-konechnostej.html).*$ http://www.clinsev.ru/services/uzi-diagnostika permanent;
    #    rewrite ^(/uslugi/161-rentgen.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/rentgenologiya permanent;
    #    rewrite ^(/uslugi/169-analiz-na-gruppu-krovi-i-rezus-faktor.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/166-kardiolog.html).*$ http://www.clinsev.ru/services/kardiologiya permanent;
    #    rewrite ^(/uslugi/55-uslugi-uzi.html).*$ http://www.clinsev.ru/services/uzi-diagnostika permanent;
    #    rewrite ^(/uslugi/157-stoimost-analizov-krovi-na-spid-i-vich.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/164-uzi-shhitovidnoj-zhelezy.html).*$ http://www.clinsev.ru/services/uzi-diagnostika permanent;
    #    rewrite ^(/uslugi/158-biohimicheskij-analiz-krovi.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/167-analiz-krovi-na-sahar.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/168-analiz-mochi.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/156-analiz-krovi-na-onkomarkery.html).*$ http://www.clinsev.ru/clinics/v-severnom/services/dnevnoy-statsionar permanent;
    #    rewrite ^(/uslugi/163-uzi-sosudov.html).*$ http://www.clinsev.ru/services/uzi-diagnostika permanent;
    #    rewrite ^(/uslugi.html).*$ http://www.clinsev.ru/clinics/v-severnom/services permanent;
    #    rewrite ^(/specialist)[^s]?.*$ http://www.clinsev.ru/clinics/v-severnom/specialists permanent;
    #    rewrite ^(/news.html).*$ http://www.clinsev.ru/publications permanent;

    }
    server {
        # to-www redirect
        server_name clinsev.ru;
        rewrite ^(.*) http://www.clinsev.ru$1 permanent;
    }
    # server {
    #     # from staging redirect
    #     server_name klinika.proektmarketing.ru;
    #     rewrite ^(.*) http://www.clinsev.ru$1 permanent;
    # }
    server {
        # old version (clinsev.ru)
        server_name old.clinsev.ru www.old.clinsev.ru;
        root /home/greghouse/www/klinika_old_clinsev;
    }

Create symbolic link of file in directory `/etc/nginx/sites-enabled`:

    cd /etc/nginx/sites-enabled
    ln -s ../sites-available/example example
