FROM centos:7

COPY ntop.repo /etc/yum.repos.d/
COPY run.sh /

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y ntopng redis hiredis-devel
RUN yum clean all

RUN sed -i 's/^daemonize no/daemonize yes/' /etc/redis.conf

CMD /run.sh

EXPOSE 3000
