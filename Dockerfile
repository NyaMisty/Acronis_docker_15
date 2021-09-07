FROM ubuntu:18.04

RUN apt update && apt install -y rpm supervisor cron &&  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor

COPY AcronisBackupSetup /tmp/acronis_setup

RUN chmod 777 /tmp/acronis_setup

RUN /tmp/acronis_setup -a -i BackupAndRecoveryAgent --skip-registration

RUN sh -c "sed -i -e '/<value name=\"MMSCurrentMachineID\" type=\"TString\">/,/<\/value>/ s|\"[0-9A-Z-]\{1,\}\"|\"\"|g' /etc/Acronis/BackupAndRecovery.config" && \
    sh -c "sed -i -e '/<value name=\"InstanceID\" type=\"TString\">/,/<\/value>/ s|\"[0-9A-Z-]\{1,\}\"|\"\"|g' /etc/Acronis/BackupAndRecovery.config" && \
    sh -c "ps aux | grep [m]ms | awk '{print \$2}' | xargs -I {} -- kill -9 {}"


COPY rsrc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY rsrc/register_mms.sh /register_mms.sh

RUN chmod 777 /register_mms.sh

CMD ["/usr/bin/supervisord"]