#!/bin/bash

rule="$@"

export EDITOR=/vagrant/scripts/add-to-crontab-editor.sh
echo "$rule" | crontab -e
