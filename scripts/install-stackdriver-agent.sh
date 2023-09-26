#!/bin/sh

if [ `/vagrant/scripts/platform.sh` = google ]; then
    cd /tmp
    curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh && sudo bash add-monitoring-agent-repo.sh --also-install && sudo service stackdriver-agent start
fi
