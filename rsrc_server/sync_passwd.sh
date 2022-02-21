#!/bin/bash

DIR=$(realpath "$(dirname "$0")")

while true; do
    /usr/local/libexec/unison /etc/ /var/etc_pass/ -path passwd -path shadow -group -owner -perms 777 -nodeletion /etc/ -auto
    sleep 5
done