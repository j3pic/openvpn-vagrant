#!/bin/bash

if [ -e /vagrant/assigned-branch ]; then
    cat /vagrant/assigned-branch
else
    echo master
fi
