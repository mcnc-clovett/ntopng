FROM ubuntu:20.04
ENV TZ=America/New_York
RUN set -xe \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install -y curl gnupg \
    && curl -sSL http://packages.ntop.org/apt-stable/ntop.key | apt-key add - \
    && { \
         echo "deb http://packages.ntop.org/apt/20.04/ x64/"; \
         echo "deb http://packages.ntop.org/apt/20.04/ all/"; \
       } > /etc/apt/sources.list.d/ntop.list \
    && apt update \
    && apt install -y ntopng \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all

ENTRYPOINT ["ntopng"]
CMD ["/etc/ntopng/ntopng.conf","--community","--redis","localhost"]

EXPOSE 3000

