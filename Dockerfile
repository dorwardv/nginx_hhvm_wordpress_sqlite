from dorwardv/jessie_nginx_hhvm
MAINTAINER Dorward Villaruz <dorwardv@gmail.com>

RUN rm -rf ${DOCUMENT_ROOT}/*
RUN wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xzvf /wordpress.tar.gz --strip-components=1 --directory ${DOCUMENT_ROOT}

RUN wget -O sqlite-plugin.zip https://downloads.wordpress.org/plugin/sqlite-integration.1.7.zip

RUN apt-get update
RUN apt-get install -y unzip
RUN unzip sqlite-plugin.zip -d ${DOCUMENT_ROOT}/wp-content/plugins/
RUN rm sqlite-plugin.zip
RUN cp ${DOCUMENT_ROOT}/wp-content/plugins/sqlite-integration/db.php ${DOCUMENT_ROOT}/wp-content
RUN cp ${DOCUMENT_ROOT}/wp-config-sample.php ${DOCUMENT_ROOT}/wp-config.php

RUN chown -R www-data.www-data ${DOCUMENT_ROOT}

EXPOSE 80
EXPOSE 443

CMD service hhvm start && nginx
