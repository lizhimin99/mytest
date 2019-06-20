#!/bin/bash

TMP_NUCLIAS_CONNECT=/tmp/nuclias_connect
TMP_NUCLIAS_CONNECT_config=/tmp/nuclias_connect/config
if [ ! -d $TMP_NUCLIAS_CONNECT ];then
  mkdir -p $TMP_NUCLIAS_CONNECT
fi

cd $TMP_NUCLIAS_CONNECT
echo 'STEP 1: Start download config files'
curl -o init.sh https://raw.githubusercontent.com/lizhimin99/mytest/master/init.sh
curl -o docker-compose.yml https://raw.githubusercontent.com/lizhimin99/mytest/master/docker-compose.yml
curl -o entrypoint-initdb.sh https://raw.githubusercontent.com/lizhimin99/mytest/master/entrypoint-initdb.sh
curl -o appconfig.json https://raw.githubusercontent.com/lizhimin99/mytest/master/appconfig.json
if [ ! -d $TMP_NUCLIAS_CONNECT_config ];then
  mkdir -p $TMP_NUCLIAS_CONNECT_config
fi
cd $TMP_NUCLIAS_CONNECT_config
curl -o systemconfig.json https://raw.githubusercontent.com/lizhimin99/mytest/master/config/systemconfig.json
cd $TMP_NUCLIAS_CONNECT
echo 'Config files Download complete'
echo 'STEP2 :Please change you workdirectory and run init.sh  :
 # cd $TMP_NUCLIAS_CONNECT 
 #. init.sh '
sudo source $TMP_NUCLIAS_CONNECT'/init.sh'
