#!/bin/sh
git branch|grep '*'|cut -d' ' -f 2
