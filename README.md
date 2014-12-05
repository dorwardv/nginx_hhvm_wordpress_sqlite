## Wordpress using SQLite running on nginx with hhvm


This repository contains **Dockerfile** of Wordpress on Nginx using Sqlite instead of MySQL


### Base Docker Image

* Facebook's HHVM with nginx (https://registry.hub.docker.com/u/dorwardv/jessie_nginx_hhvm/

### Usage

    docker run -d -p 80:80 dorwardv/nginx_hhvm_wordpress_sqlite

After few seconds, open `http://<host>` to see the wordpress install page.

###Build from Dockerfile
    docker build -t="dorwardv/nginx_hhvm_wordpress_sqlite" github.com/dorwardv/nginx_hhvm_wordpress_sqlite

