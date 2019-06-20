#!/bin/bash

TMP_NUCLIAS_CONNECT=/tmp/nuclias_connect
TMP_NUCLIAS_CONNECT_config=/tmp/nuclias_connect/config
if [ ! -d $TMP_NUCLIAS_CONNECT ];then
  mkdir -p $TMP_NUCLIAS_CONNECT
fi

cd $TMP_NUCLIAS_CONNECT
echo 'download config files'
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
echo 'download finished!'
echo 'please run : ./init.sh  to install'
#sudo sh $TMP_NUCLIAS_CONNECT"/init.sh"
