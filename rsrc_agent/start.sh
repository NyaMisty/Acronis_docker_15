#!/bin/bash
/etc/init.d/aakore start
/etc/init.d/acronis_mms start
/etc/init.d/acronis_schedule start
/etc/init.d/acp-update-controller start
sleep infinity & wait
