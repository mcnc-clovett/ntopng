#!/bin/bash

/usr/bin/redis-server /etc/redis.conf

/usr/local/bin/ntopng /etc/ntopng/ntopng.conf
