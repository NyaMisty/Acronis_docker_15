#!/bin/bash

sleep_time=30
count_attempts=10
reg_agent() {
    /usr/lib/Acronis/RegisterAgentTool/RegisterAgent "$@"
}

for(( i=1; i<=$count_attempts; i++ )); do
    reg_agent "$@"
    if [[ "$?" != "0" ]]; then
        echo -e "\nNumber of attempts:\t$i of $count_attempts\nAgent registration failed.\nNew registration attempt in $sleep_time sec"
        sleep $sleep_time
    else
        exit 0
    fi
done 2>&1 | tee  mms_registration.log