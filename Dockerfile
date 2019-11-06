FROM centos:7

COPY ntop.repo /etc/yum.repos.d/
COPY run.sh /

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y ntopng
RUN yum clean all

CMD /run.sh

EXPOSE 3000
