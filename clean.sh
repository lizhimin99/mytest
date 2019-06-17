#!/usr/bin/env bash

echo "clean file will delete log_file and user_file"
echo "Are you sure ? [y/n]"
read k
if ["$k" != "y"] 
then exit 0
fi
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo "start clean ...."
rm -rf ${SHELL_FOLDER}/log/*
rm -rf ${SHELL_FOLDER}/customer/*

echo "clean success!"
