FROM jenkins
USER root

RUN apt-get update && apt-get install -y ruby-full

# Give jenkins access to docker
RUN groupadd -g 999 docker
RUN gpasswd -a jenkins docker

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER jenkins
