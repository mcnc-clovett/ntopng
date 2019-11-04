FROM centos:7

COPY ntop.repo /etc/yum.repos.d/

RUN yum install -y epel-release
RUN yum install -y redis ntopng hiredis-devel

RUN sed -i 's/^daemonize no/daemonize yes/' /etc/redis.conf

RUN /usr/bin/redis-server /etc/redis.conf
RUN /usr/local/bin/ntopng /etc/ntopng/ntopng.conf

EXPOSE 3000