FROM ruby:2.7-slim-buster

RUN apt update && apt install -y \
        gcc \
        build-essential \
        zlib1g-dev \
        libxml2-dev \
        libmagickwand-dev \
        imagemagick \
        ruby-dev \
        wget \
        libmariadb-dev-compat \
        libmariadb-dev

WORKDIR /tmp

RUN wget http://www.redmine.org/releases/redmine-4.0.5.tar.gz && tar xzf ./redmine-4.0.5.tar.gz && rm -f redmine-4.0.5.tar.gz
RUN mv ./redmine-4.0.5 /opt/redmine

WORKDIR /opt/redmine/

COPY redmine/database.yml config/database.yml

COPY redmine/start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["sh", "-c" ," . /opt/redmine/start.sh"]
