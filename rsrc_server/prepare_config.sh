#!/bin/bash

cd /def_config  \
&& (if [ -z "$(ls -A /home)" ]; then cp -ra home/. /home; fi) \
&& (if [ -z "$(ls -A /var/lib/Acronis)" ]; then cp -ra var_lib_Acronis/. /var/lib/Acronis; fi) \
&& (if [ -z "$(ls -A /var/lib/alsdb)" ]; then cp -ra var_lib_alsdb/. /var/lib/alsdb; fi) \
&& (if [ -z "$(ls -A /etc/Acronis)" ]; then cp -ra etc_Acronis/. /etc/Acronis; fi) \
&& (if [ -z "$(ls -A /opt/acronis/management_agent/var)" ]; then cp -ra opt_acronis_mms_var/. /opt/acronis/management_agent/var; fi) \

#cp -a /etc/etc_pass/passwd /etc/etc_pass/shadow /etc
#ln -sf /var/etc_pass/passwd /etc/passwd
#ln -sf /var/etc_pass/shadow /etc/shadow

#LD_LIBRARY_PATH=/usr/lib/Acronis/BackupAndRecovery/Common:/usr/lib/Acronis/system_libs/8.2.1 /usr/lib/Acronis/UpgradeTool/upgrade_tool-bin --workflow=ams