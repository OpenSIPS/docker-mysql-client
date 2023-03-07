FROM mysql:latest
LABEL maintainer="Razvan Crainea <razvan@opensips.org>"

USER root

ADD "run.sh" "/run.sh"

ENV MYSQL_HOME /home

ENTRYPOINT ["/run.sh"]
