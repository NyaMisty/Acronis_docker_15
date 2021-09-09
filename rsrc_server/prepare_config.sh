#!/bin/bash

cd /def_config  \
&& (if [ -z "$(ls -A /home)" ]; then cp -ra home/. /home; fi) \
&& (if [ -z "$(ls -A /var/lib/Acronis)" ]; then cp -ra var_lib_Acronis/. /var/lib/Acronis; fi) \
&& (if [ -z "$(ls -A /var/lib/mondb)" ]; then cp -ra var_lib_mondb/. /var/lib/mondb; fi) \
&& (if [ -z "$(ls -A /etc/Acronis)" ]; then cp -ra etc_Acronis/. /etc/Acronis; fi) \
&& (if [ -z "$(ls -A /etc/pass_conf)" ]; then cp -a passwd shadow /etc/pass_conf; fi) \

cp -a /etc/pass_conf/passwd /etc/pass_conf/shadow /etc